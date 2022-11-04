<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KonsimentoOperation_2.aspx.cs" Inherits="ExternalTrade.KonsimentoOperation_2" %>

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
        /*.cizgi {
            border: groove;
        }*/

       

        /*@media (prefers-reduced-motion:reduce) {
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
        }*/


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

        .yaziboyutu {
            font-size: 10px;
        }

        .baslik {
            font-size: 10px;
        }

  
        /*.arkaplannigtas {
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
        }*/
        /*.th{
            padding:0px,0px,0px,0px;
        }*/
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
       function successAlert() {
           swal({
               title: "İŞLEM TAMAMLANDI", text: "KAYDINIZ GÜNCELLENDİ", type: "success"
           }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
       }
       function FCLNO() {
           swal({
               title: "DİKKAT", text: "FCN NO Alanını Boş Geçemezsiniz", type: "warning"
           });
       }
       function booking() {
           swal({
               title: "DİKKAT", text: "BOOKING NO Alanını Boş Geçemezsiniz", type: "warning"
           });
       }
       function duzenleme() {
           swal({
               title: "DİKKAT", text: "Düzenleme Bilgisi Boş Geçemezsiniz", type: "warning"
           });

       }
       function HSCODE() {
           swal({
               title: "DİKKAT", text: "HS CODE Alanını Boş Geçemezsiniz", type: "warning"
           });
       }
       function CleanOnBoard() {
           swal({
               title: "DİKKAT", text: "Clean On Board Alanını Boş Geçemezsiniz", type: "warning"
           });
       }
       function UpdatePOSuccess() {
           swal({
               title: "İŞLEM TAMAMLANDI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENDİ", type: "success"
           }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
       }
       function UpdatePOError() {
           swal({
               title: "İŞLEM TAMAMLANAMADI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
           });
       }
       function successNotify() {
           swal({
               title: "İŞLEM TAMAMLANDI", text: "NOTIFIY BİLGİLERİ GÜNCELLENDİ", type: "success"
           }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
        }
        function errorNotify() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "NOTIFIY BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
            });
        }
        function UpdateEkipmanSuccess() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "EKİPMAN GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
       }
       function UpdateEkipmanError() {
           swal({
               title: "İŞLEM TAMAMLANAMADI", text: "EKİPMAN GÜNCELLENEMEDİ", type: "error"
           });
       }

       function UpdateHSSuccess() {
           swal({
               title: "İŞLEM TAMAMLANDI", text: "HC CODE BİLGİLERİ GÜNCELLENDİ", type: "success"
           }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
}
function UpdateHSError() {
    swal({
        title: "İŞLEM TAMAMLANAMADI", text: "HC CODE  BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
    });
}
function degis() {
    swal({
        title: "İŞLEM TAMAMLANDI", text: "BİLGİLERİ GÜNCELLENDİ", type: "success"
    }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
          }
          function degisme() {
              swal({
                  title: "İŞLEM TAMAMLANAMADI", text: "BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
              });
          }
          function Baslik() {
              swal({
                  title: "İŞLEM TAMAMLANDI", text: "BAŞLIKLAR GÜNCELLENDİ", type: "success"
              }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });

        }
        function BaslikError() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "PO BİLGİSİ GÜNCELLENEMEDİ", type: "error"
            });

        } function Not() {
            swal({
                title: "DİKKAT", text: "NOTIFY BOŞ GEÇİLEMEZ", type: "warning"
            });

        }
        function cari() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "BİLGİLER GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"]%>&gelen=1' });
        }

        function carierror() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "BİLGİLER GÜNCELLENEMEDİ", type: "error"
            });
        }
    </script>


</head>

<body style="background-color:white">
    <form id="form1" runat="server">
        <asp:Panel ID="pnl1" runat="server">
   <div style="text-align: center;height:10px;">
       <asp:Button ID="Button1" Text="PDF" runat="server" OnClick="btnPDF_Click" CssClass="btn btn-warning" BackColor="Orange" ForeColor="White" Height="40px" />
  <a href="OperationKonsimento.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
       
         </div>
</asp:Panel>
    
    <div id="pdf" class="table-responsive">
       
        <%
            Session.Timeout = 90000;
            if (Request.QueryString["kod"] == null)
                Response.Redirect("Home.aspx");
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            string[] firma = new string[10];
            string[] baslik = new string[20];
            string[] banka = new string[10];
            string[] fatura = new string[10];
            string[] paket = new string[10];
            string[] baslikdetay = new string[20];
            string[] foot = new string[20];
            int kayitsayisi;
            int[] netagirlik = new int[2];
            int[] brutagirlik = new int[2];
            string[] notifiy = new string[16];
            netagirlik[1] = 0;
            brutagirlik[1] = 0;
            int[] konteynersayisi = new int[1];
            SqlCommand konteynersayisicek = new SqlCommand("select  SUM(distinct SiparistekiKonteynerSayisi)  from Orders where SPECODE='" + Request.QueryString["kod"] + "'", con);
            konteynersayisi[0] = Convert.ToInt32(konteynersayisicek.ExecuteScalar());
            SqlCommand agirlikcek = new SqlCommand("select case when REPLACE(Palet , 'YOK',0) <> 0 then Palet when REPLACE(Palet,'YOK',0) =0 then case when replace(BBAgirligi, 'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0)=0 then '' end end as UniteAgirlik,case when replace(Palet , 'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when replace(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+30 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as BrutAgirlik from Orders o  where SPECODE=@p1", con);
            agirlikcek.Parameters.AddWithValue("@p1",Request.QueryString["kod"]);
            SqlDataReader agirlikoku = agirlikcek.ExecuteReader();
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
          

            SqlCommand kayit = new SqlCommand("select COUNT(Urun) from Orders where SPECODE=@p1", con);
            kayit.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
            kayitsayisi = Convert.ToInt32(kayit.ExecuteScalar());
            SqlCommand baslikcek = new SqlCommand("select Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company from Orders where SPECODE=@p1 group by Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company", con);
            baslikcek.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
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
            SqlCommand baslikcek2 = new SqlCommand("select PO,KonsimentoSpecialNote,OperationInvoice,OperationInvoiceDate,FreeTime from AllOperationDocuments where SPECODE='" + Request.QueryString["kod"] + "'", con);
            SqlDataReader baslikoku2 = baslikcek2.ExecuteReader();
            while (baslikoku2.Read())
            {
                baslik[8] = baslikoku2["OperationInvoice"].ToString();
                baslik[9] = baslikoku2["OperationInvoiceDate"].ToString();
                baslik[7] = baslikoku2["KonsimentoSpecialNote"].ToString();
                baslik[10] = baslikoku2["FreeTime"].ToString();
                //baslik[11] = baslikoku2["HSCODE"].ToString();
                baslik[3] = baslikoku2["PO"].ToString();
            }
            baslikoku2.Close();
            int esikdeger = 8;
            int sayac = 0;
            string booking = "";
            string[] bookingnumber = new string[10]; 
            SqlCommand mamulsayisi = new SqlCommand("select COUNT(mamul.NAME) from Orders o left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on o.YediyuzluKod=mamul.CODE where o.Durum='SATISA DONDU' and mamul.NAME is not null and o.SPECODE=@p1", con);
            mamulsayisi.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
            sayac = Convert.ToInt32(mamulsayisi.ExecuteScalar());
            sayac = esikdeger - sayac;
            SqlCommand baslikdetaycek = new SqlCommand("select c.Cari as CARİADI ,c.Adres1 as ADRES1,c.Adres2 as ADRES2,c.VergiNo as VERGINO,c.Telno1,c.IlgiliKisi,c.Fax as FAX,c.Mail as EMAIL,c.WebSite as WEBSITE,TaxId_Text,TelNo_Text,Fax_Text,Mail_Text,WebSite_Text,ResponsinblePerson_Text  from CustomerAddress c left outer join Orders o on c.CariKodu=o.MusteriKodu where c.SPECODE=@p1 group by c.Cari, c.Cari ,c.Adres1,c.Adres2 ,c.VergiNo,c.Telno1,c.IlgiliKisi,c.Fax,c.Mail ,c.WebSite,c.TeklifNo,TaxId_Text,TelNo_Text,Fax_Text,Mail_Text,WebSite_Text,ResponsinblePerson_Text ", con);
            baslikdetaycek.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
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
            SqlCommand foott = new SqlCommand("select REPLACE(REPLACE(o.Vade,'Peşin','CASH IN ADVANCE'),'Gün','DAYS AFTER B/L') as Vade,case when o.KalkisLimani='MIP' Then 'MIP (MERSIN INTERNATIONAL PORT)' when o.KalkisLimani='Limak' then 'ISKENDERUN LIMAK' when KalkisLimani='YOK' then '' else UPPER(KalkisLimani) end as KalkisLimani,UPPER(REPLACE(o.VarisLimani,'YOK','')) as VarisLimani,REPLACE(o.TeklifTipi,'YOK','') as TeklifTipi,SUM(o.buUrununSiparisTonaji*1000) as MIKTAR,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int) as Konteyner,case  when EkipmanTuru='40 DV' then  CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 40 HC' when EkipmanTuru='20 DV' then CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 20 DC'  end as Ekipman,case when EkipmanTuru='20 DV' then 20*30 when EkipmanTuru='40 DV' then 40*30 else 0 end as Gross,case when EkipmanTuru='20 DV' then 32 when EkipmanTuru='40 DV' then 67 end as CMB from Orders o  where o.SPECODE=@p1 group by o.Vade,o.KalkisLimani,o.VarisLimani,o.TeklifTipi,EkipmanTuru", con);
            foott.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
            SqlDataReader footer = foott.ExecuteReader();
            while (footer.Read())
            {
                foot[0] = footer["Vade"].ToString();
                foot[1] = footer["KalkisLimani"].ToString();
                foot[2] = footer["VarisLimani"].ToString();
                foot[3] = footer["TeklifTipi"].ToString();
                foot[4] = footer["MIKTAR"].ToString();
                foot[5] = footer["Konteyner"].ToString();

                foot[7] = footer["Ekipman"].ToString();
                foot[8] = Convert.ToString(Convert.ToDouble(footer["MIKTAR"]) + Convert.ToDouble(footer["Gross"]));
                foot[9] = footer["CMB"].ToString();

            }
            footer.Close();
            SqlCommand foott2 = new SqlCommand("select MoneyText from AllOperationDocuments where SPECODE='" + Request.QueryString["kod"] + "'", con);
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
            SqlCommand b = new SqlCommand("select BOOKINGNUMBER from AllOperationDocuments where SPECODE=@p1",con);
            b.Parameters.AddWithValue("@p1",Request.QueryString["kod"]);
            booking = Convert.ToString(b.ExecuteScalar());
            if(booking==null || booking=="")
            {
                SqlCommand bookingcek = new SqlCommand("select book.BOOKINGNO as booking from Orders o left outer join DTBSSRVR.TIGERDB.dbo.LG_219_01_ORFICHE FC on o.SiparisNo=FC.FICHENO left outer join  DTBSSRVR.TIGERDB.dbo.LG_XT1012001_219  book on FC.LOGICALREF=book.PARLOGREF where o.SPECODE=@p1 and book.BOOKINGNO is not null",con);
                bookingcek.Parameters.AddWithValue("@p1",Request.QueryString["kod"]);
                SqlCommand gu = new SqlCommand("update AllOperationDocuments set BOOKINGNUMBER='" + Convert.ToString(bookingcek.ExecuteScalar()) + "' where SPECODE='" + Request.QueryString["kod"] + "'", con);
                booking = Convert.ToString(gu.ExecuteScalar());
            }
            else
            {
                booking = Convert.ToString(b.ExecuteScalar());
            }
            string[] kontipi = new string[14];
            SqlCommand kontipicek = new SqlCommand("select a.KonsimentoEdit,a.HSCODE,ISNULL(HSCODE2,'') as HSCODE2,ISNULL(a.HSCODE3,'') as HSCODE3,ISNULL(a.HSCODE4,'') as HSCODE4,PO,case when o.TeklifTipi='EXW' or o.TeklifTipi='FCA' or o.TeklifTipi='FAS' or  o.TeklifTipi='FOB' or o.TeklifTipi='YOK' then 'COLLECT' when o.TeklifTipi='CFR' or o.TeklifTipi='CIF' or o.TeklifTipi='DAP' or  o.TeklifTipi='DAT' then 'PREPAID'  end as CLEANONBOARD from AllOperationDocuments a left outer join Orders o on a.SPECODE=o.SPECODE where a.SPECODE=@p1", con);
            kontipicek.Parameters.AddWithValue("@p1",Request.QueryString["kod"]);
            SqlDataReader oku = kontipicek.ExecuteReader();
            while(oku.Read())
            {
                kontipi[0] = oku["KonsimentoEdit"].ToString();
                kontipi[1] = oku["HSCODE"].ToString();
                kontipi[2] = oku["CLEANONBOARD"].ToString();
                kontipi[3] = oku["PO"].ToString(); 
                kontipi[4] = oku["HSCODE2"].ToString();
                kontipi[5] = oku["HSCODE3"].ToString();
                kontipi[6] = oku["HSCODE4"].ToString();
            }
            oku.Close();
            string email = "";
            SqlCommand emailcek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.KonsimentoOlusturan=u.Id where o.SPECODE='" + Request.QueryString["kod"] + "'", con);
            email = Convert.ToString(emailcek.ExecuteScalar());

            SqlCommand notifycek = new SqlCommand("select  NotifiyName,NotifiyAdres,NotifiyUlke,NotifiyRut,NotifiyTelNo,NotifiyContact,NotifyMailAdress,NotifyWebSite,NotifyResponsiblePerson,NotifiyRut_Text,NotifiyTelNo_Text,NotifiyContact_Text,NotifyMailAdress_Text,NotifyWebSite_Text,NotifyResponsiblePerson_Text   from AllOperationDocuments where SPECODE='" + Convert.ToString(Request.QueryString["kod"]) + "'", con);
            SqlDataAdapter danot = new SqlDataAdapter();
            danot.SelectCommand = notifycek;
            DataTable ntf = new DataTable();
            danot.Fill(ntf);
            foreach (DataRow dr in ntf.Rows)
            {
                notifiy[0] = dr["NotifiyName"].ToString();
                notifiy[1] = dr["NotifiyAdres"].ToString();
                notifiy[2] = dr["NotifiyUlke"].ToString();
                notifiy[3] = dr["NotifiyRut_Text"].ToString();
                notifiy[4] = dr["NotifiyRut"].ToString();
                notifiy[5] = dr["NotifiyTelNo_Text"].ToString();
                notifiy[6] = dr["NotifiyTelNo"].ToString();
                notifiy[7] = dr["NotifiyContact_Text"].ToString();
                notifiy[8] = dr["NotifiyContact"].ToString();
                notifiy[9] = dr["NotifyMailAdress_Text"].ToString();
                notifiy[10] = dr["NotifyMailAdress"].ToString();
                notifiy[11] = dr["NotifyWebSite_Text"].ToString();
                notifiy[12] = dr["NotifyWebSite"].ToString();
                notifiy[13] = dr["NotifyResponsiblePerson_Text"].ToString();
                notifiy[14] = dr["NotifyResponsiblePerson"].ToString();
            }
            SqlCommand konsimentokayitsayisicek = new SqlCommand("select COUNT(distinct FCLNO) from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu'", con);
            int konsimentokayitsayisi = Convert.ToInt32(konsimentokayitsayisicek.ExecuteScalar());
            SqlCommand paketsayisicek = new SqlCommand("select ISNULL(SUM(PaletSayisi),0) as sayi from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu'", con);
            int paletsayisi = Convert.ToInt32(paketsayisicek.ExecuteScalar());
             %>
            <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel">BOOKING EDIT</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                  
                                                   <asp:TextBox ID="txtBooking" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">Close</button>
                                                   <%-- <button type="button" class="btn btn-primary waves-effect waves-light">Save changes</button>--%>
                                                    <asp:Button ID="btn" runat="server" Text="KAYDET" CssClass="btn btn-success" OnClick="btn_Click" />
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
                                                        <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="Button3_Click"/>
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
            <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="mySmallModalLabel">FREE TIME</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                 FREE TIME<br />
                                                    <asp:TextBox ID="txtFreeTime" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:Button ID="btnFreeTime" OnClick="btnFreeTime_Click" runat="server" Text="KAYDET" CssClass="btn btn-primary" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
             <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myLargeModalLabel">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    
                                                </div>
                                                
                                                <div class="modal-body">
                                                    <asp:DropDownList ID="drpKonsimentoTipi" runat="server" CssClass="form-control">
                                                        <asp:ListItem>OBL</asp:ListItem>
                                                        <asp:ListItem>SWB</asp:ListItem>
                                                        <asp:ListItem>TELEXRELEASE</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                      <asp:Button ID="btnKonsimento" runat="server"  Text="KAYDET" CssClass="btn btn-success" OnClick="btnKonsimento_Click"/>
                                                </div>
                                              
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
        <%-- <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalScrollableTitle">CLEAN ON BOARD</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <asp:DropDownList ID="drpClean" runat="server" CssClass="form-control">
                                                        <asp:ListItem Text="COLLECT"></asp:ListItem>
                                                        <asp:ListItem Text="PREPAID"></asp:ListItem>
                                                    </asp:DropDownList>
                                                  
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                            
                                                    <asp:Button ID="btnclean" runat="server" Text="KAYDET" CssClass="btn btn-success" OnClick="btnclean_Click"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
      
         <div class="modal fade" id="staticBackdrop2" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel2">NOTIFY</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                            <p>NOFITIY NAME</p>
                            <p>
                                <asp:TextBox ID="txtNotifyName" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>

                            <p>NOFITIY ADRESS</p>
                            <p>
                                <asp:TextBox ID="txtNofifyAdres" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>
                            <p>NOTIFIY COUNTRY</p>
                            <p>
                                <asp:TextBox ID="txtNotifyUlke" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>

                            <p>NOTIFIY <%=notifiy[3] %> TEXT</p>
                            <p>
                                <asp:DropDownList ID="drpNotifyRut_Text" runat="server" CssClass="form-control"></asp:DropDownList>
                            </p>

                            <p>NOTIFIY <%=notifiy[3] %></p>

                            <p>
                                <asp:TextBox ID="txtNotifyRut" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>

                            <p>NOTIFIY <%=notifiy[5] %> TEXT</p>
                            <p>
                                <asp:DropDownList ID="drpNotifyTelNo" runat="server" CssClass="form-control"></asp:DropDownList></p>

                            <p>NOTIFIY <%=notifiy[5] %></p>
                            <p>
                                <asp:TextBox ID="txtNotifyTelNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>
                            <p>NOTIFIY <%=notifiy[7] %> TEXT</p>
                            <p>
                                <asp:DropDownList ID="drpNotifiyFax_Text" runat="server" CssClass="form-control"></asp:DropDownList>
                                
                            </p>
                            <p>
                                NOTIFIY <%=notifiy[7] %>
                            </p>
                            <p>
                                <asp:TextBox ID="txtNotifyFax" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>
                            <p>
                                NOTIFIY <%=notifiy[9] %> TEXT
                            </p>
                            <p>
                                <asp:DropDownList ID="drpNotifyMailAddress_Text" runat="server" CssClass="form-control"></asp:DropDownList>
                               
                            </p>
                            <p>
                                NOTIFIY <%=notifiy[9] %>
                            </p>
                            <p>
                                <asp:TextBox ID="txtNotifyMailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>
                            <p>NOTIFIY <%=notifiy[11] %> TEXT</p>
                            <p>
                                <asp:DropDownList ID="drpNotifyWebSite_Text" runat="server" CssClass="form-control"></asp:DropDownList>
                              
                            </p>
                            <p>
                                NOTIFIY <%=notifiy[11] %>
                            </p>
                            <p>
                                <asp:TextBox ID="txtNotifyWebSite" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>
                            <p>NOTIFIY <%=notifiy[13] %> TEXT</p>
                            <p>
                                <asp:DropDownList ID="drpNotifyResponsiblePerson_Text" runat="server" CssClass="form-control"></asp:DropDownList>
                            </p>
                            <p>
                                NOTIFIY <%=notifiy[13] %>
                            </p>
                            <p>
                                <asp:TextBox ID="txtNotifyResponsiblePerson" runat="server" CssClass="form-control"></asp:TextBox>
                            </p>

                            <p>
                                <asp:CheckBox ID="chkAyni" runat="server" />&nbsp;&nbsp;Consignee ile aynı
                            </p>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>

                                <asp:Button ID="Button2" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button2_Click" />
                            </div>
                        </div>
                                          <%--  <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                               
                                                <asp:Button ID="Button2" runat="server"  Text="KAYDET"  CssClass="btn btn-primary" OnClick="Button2_Click"/>
                                            </div>--%>
                                        </div>
                                        </div>
                                    </div>
             </div>
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
                                                    <asp:Button ID="Button4" runat="server" Text="GÜNCELLE" CssClass="btn btn-primary" OnClick="Button4_Click"  />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" id="mdl" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">SPECIAL NOTE</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   <div>
                                                       SPECIAL NOTE
                                                       <asp:TextBox ID="txtKonsimentoSpecialNote" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                   </div>
                                                    <div>
                                                        <asp:Button ID="btnKonsimentoSpecialNote" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="btnKonsimentoSpecialNote_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->


           <%-- <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" id="mdl2" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel3">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   <div>
                                                       TAX ID/
                                                       <asp:TextBox ID="txtTAXID" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                     <div>
                                                       TEL NO/
                                                       <asp:TextBox ID="TxtTELNOO" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                      <div>
                                                      FAX/
                                                       <asp:TextBox ID="txtFAX" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                      <div>
                                                       MAIL/
                                                       <asp:TextBox ID="txtMAIL" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                      <div>
                                                       WEB SITE/
                                                       <asp:TextBox ID="txtWebSite" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                      <div>
                                                       RESPONSIBLE PERSON/
                                                       <asp:TextBox ID="txtResponsiblePerson" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                   
                                                    <div>
                                                        <asp:Button ID="Button5" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button5_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->--%>
            <div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                   <asp:Button ID="Button6" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button41_Click" />
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
                                                        <%=baslikdetay[10] %> REPLACE
                                                        <asp:DropDownList ID="drp2" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                  
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button7" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button5_Click"/>
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
                                                         <%=baslikdetay[12] %> REPLACE
                                                        <asp:DropDownList ID="drp3" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                     
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button8" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button6_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
           <div id="myModal6" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                   <asp:Button ID="Button9" runat="server" Text="KAYDET" CssClass="btn btn-primary"  OnClick="Button7_Click"/>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
           <div id="myModal7" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                   <asp:Button ID="Button10" runat="server" Text="KAYDET" OnClick="Button8_Click" CssClass="btn btn-primary"    />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
         <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                   <asp:Button ID="Button11" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button11_Click"  />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>

        <%
            if (konsimentokayitsayisi <= 4)
            {%>
                <table  class="table table-sm">
                <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
                {%>
                        <tr style="height: 18%;">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
           <tr>
                <td class="yaziboyutu" style="text-align: center"><span><b>Date :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=DateTime.Now.ToShortDateString() %></b></td>
                  <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center"><span><b>PO :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=kontipi[3] %></b></td>
            </tr>
               <tr>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><span><b>SHIPPER </b></span></td>
                <td colspan="4" class="cizgi orta baslik" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><b>CONSIGNEE</b></a></td>
            </tr>
             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=baslik[6] %></b> </span></td>
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
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal3" style="color:black;text-decoration:none"> <%=baslikdetay[9] %>:</a></b></span></td>
               <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3]%></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"> <b> <a href="#" data-toggle="modal" data-target="#myModal4" style="color:black;text-decoration:none"><%=baslikdetay[10] %>:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><%=baslikdetay[4] %></b> </td>
            </tr>
           
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>FAX:</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[5] %></b> </td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi" ><b><a href="#" data-toggle="modal" data-target="#myModal5" style="color:black;text-decoration:none"> <%=baslikdetay[12] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=email %></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal6" style="color:black;text-decoration:none"> <%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>

                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span><b style="font-size:11px;"><a href="#" data-toggle="modal" data-target="#myModal7" style="color:black;text-decoration:none"> <%=baslikdetay[14] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[5] %></b></td>
            </tr>

           <tr>
                <td colspan="8" class="cizgi sol baslik" style="height:25px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#staticBackdrop2">NOTIFIY</a> </b></span></td>
            </tr>
           
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b>
                    
                     <%
                    if (notifiy[0].Length >= 1)
                    {
                        %>
                        
                        <%=notifiy[0] %>&nbsp;
                    <%}
                    if (notifiy[1].Length >= 1)
                    {
                        %>
                        Address:
                        <%=notifiy[1] %>&nbsp;
                    <%
                    }
                    if (notifiy[2].Length >= 1)
                    {
                        %>
                        Country:
                        <%=notifiy[2] %>&nbsp;
                    <%
                    }
                    if (notifiy[4].Length >= 1)
                    {
                        %>
                         <%=notifiy[3] %>&nbsp;:
                        <%=notifiy[4] %>&nbsp;
                    <%
                    }
                    if (notifiy[6].Length >= 1)
                    {
                        %>
                         <%=notifiy[5] %>&nbsp;:
                        <%=notifiy[6] %>&nbsp;
                    <%
                    }
                    if (notifiy[8].Length >= 1)
                    {
                        %>
                         <%=notifiy[7] %>&nbsp;:
                        <%=notifiy[8] %>&nbsp;
                    <%
                    }
                    if (notifiy[10].Length >= 1)
                    {
                        %>
                         <%=notifiy[9] %>&nbsp;:
                        <%=notifiy[10] %>&nbsp;
                    <%
                    }
                    if (notifiy[12].Length >= 1)
                    {
                        %>
                         <%=notifiy[11] %>&nbsp;:
                        <%=notifiy[12] %>&nbsp;
                    <%
                    }
                    if (notifiy[14].Length >= 1)
                    {
                        %>
                         <%=notifiy[13] %>&nbsp;:
                        <%=notifiy[14] %>&nbsp;
                    <%
                    }
                        %>
                    
                    
   




                                                                                                        </b></span></td>
            </tr>
   
     
       <tr>
         <td colspan="8" class="baslik cizgi orta" style="height:30px;"><b> <a href="#"  style="color:black; text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-lg"><%=kontipi[0] %>&nbsp;OLARAK DUZENLENECEKTIR</a></b></td>
        </tr>
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                     int kolonsayisi = 1;
                     SqlCommand fcl1 = new SqlCommand("select COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + " ' and SiparisTipi='Çoklu' group by FCLNO", con);
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and  k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE and kp.SPECODE=o.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,kp.MamulKodu,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%
                                        
                                    
                                    }
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["Brut"]) + netvebrut[1];
                                        %>
                                        
                             
                               
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                            
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                for (int i = kayitsayisi+1; i <= 4; i++)
                {%>
                    <tr>
                          <td colspan="8" style="height: 50px; width: 50px;" class="sol cizgi yaziboyutu"><b><%=i.ToString() %></b></td>
                    </tr>
                    
                <%}
                     
                 %>  
         
                    <%
                        int[] pallets = new int[1];
                        pallets[0] = 0;
                        double[] totaldegerler = new double[4];
                        totaldegerler[0] = 0;
                        SqlCommand pcek = new SqlCommand("select COUNT(distinct k.FCLNO), case when o.Palet='YOK' then 0 when Palet <> 'YOK' then COUNT(distinct k.FCLNO)*20    end as Palet from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.SiparisTipi='Çoklu' group by o.Palet", con);
                        //pcek.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader pp = pcek.ExecuteReader();
                        while (pp.Read())
                        {
                            totaldegerler[0] = totaldegerler[0] + Convert.ToInt32(pp["Palet"]);
                        }
                        pp.Close();

                        SqlCommand netttotal = new SqlCommand("select ISNULL(SUM(k.KonteynerdakiTonaj),0) as NET  from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.SiparisTipi='Çoklu'", con);
                        totaldegerler[1] = Convert.ToDouble(netttotal.ExecuteScalar());
                        SqlCommand fclfarklı = new SqlCommand("Konsimento_Gros_Total_Coklu", con);
                        fclfarklı.Parameters.AddWithValue("@SPECODE",Request.QueryString["kod"]);
                        //totaldegerler[2] = totaldegerler[1] + (Convert.ToDouble(fclfarklı.ExecuteScalar()) * 30);
                        fclfarklı.CommandType = CommandType.StoredProcedure;
                        
                        SqlDataAdapter fclfarlioku = new SqlDataAdapter();
                        fclfarlioku.SelectCommand = fclfarklı;
                        DataTable dtr = new DataTable();
                        fclfarlioku.Fill(dtr);
                        foreach (DataRow dr in dtr.Rows)
                        {
                            totaldegerler[2] = totaldegerler[2] + Convert.ToInt32(dr["BRUT"]);
                        }
                        SqlCommand paletlericek = new SqlCommand("select CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int),0) when  REPLACE(o.Palet,'YOK',0) = 0 then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int),0)  END as PALET  from KonsimentoProduct kp left outer join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "'  and kp.SiparisTipi='Çoklu'  group by kp.FCLNO,o.Palet,o.BBAgirligi", con);
                        SqlDataReader paletlerioku = paletlericek.ExecuteReader();
                        while(paletlerioku.Read())
                        {
                            pallets[0] = pallets[0] + Convert.ToInt32(paletlerioku["PALET"]);
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
                <td class="cizgi yaziboyutu" style="height:15px;"><b>PACKAGE</b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                SqlCommand pakettipi4 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','PE Kraft'),'PE siz Kraft','Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where SPECODE=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi4.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader p4 = pakettipi4.ExecuteReader();
                        while (p4.Read())
                        {%>
                          <span><b><%=p4["Torba"].ToString() %>&nbsp;<%=p4["UniteAgirlik"].ToString() %>KGS &nbsp;<%=p4["BigBag"].ToString() %>&nbsp;<%=p4["Palet"].ToString() %>&nbsp;<%=p4["Strec"].ToString() %>&nbsp;(<%=p4["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%}
                 %>
                 </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL </a></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span ><%=foot[7] %></span></b></td>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#mdl">SPECIAL NOTES</a></span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><a href="#" data-toggle="modal" style="color:black;text-decoration:none" data-target=".bs-example-modal-sm" >FREE TIME</a> </b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=baslik[10] %></span></b></td>
                   <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="3" rowspan="4"><b><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;"><%=baslik[7]%></textarea></b></td>
            </tr>

            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b>ORIGIN OF GOODS</b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TURKEY</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b>PORT OF LOADING</b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[1] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b>PORT OF DELIVERY</b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[2] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" ><b><a href="#" style="text-decoration:none;color:black;" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></b></td>                       
              <td class="cizgi yaziboyutu"  colspan="4"><b><span><%=kontipi[1] %>


                   <%
                if (kontipi[4] != "")
                {%>
                    &nbsp;/<%=kontipi[4] %>
                <%}
                if (kontipi[5] != "")
                {%>
                    &nbsp;/<%=kontipi[5] %>
                <%}
                if (kontipi[6] != "")
                {%>
                    &nbsp;/<%=kontipi[6] %>
                <%}
                      
                  %>
                                                           </span></b></td>
                 <td class="cizgi yaziboyutu orta" colspan="3" rowspan="3"><b><span><asp:Image ID="img_yeri" runat="server" Height="100" /></span></b></td>
            </tr>

              <tr>
                <td class="cizgi yaziboyutu" ><b>CMB</b></td>
              <td class="cizgi yaziboyutu"  colspan="4"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" ><b>CLEAN ON BOARD</b></td>
              <td class="cizgi yaziboyutu" colspan="4"><b><span>FREIGHT &nbsp; <%=kontipi[2] %></span></b></td>
            </tr>
                     <tr>
                <td class="cizgi yaziboyutu orta" colspan="8" ><b>1</b></td>
             
            </tr>
        </table>
            <%}
             
              
              
              //4-8
              
            else if (konsimentokayitsayisi > 4 && konsimentokayitsayisi <= 24)
            {%>
                <table  class="table table-sm">
                <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
                {%>
                        <tr style="height: 18%;">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
           <tr>
                <td class="yaziboyutu" style="text-align: center"><span><b>Date :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=DateTime.Now.ToShortDateString() %></b></td>
                  <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center"><span><b>PO :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=kontipi[3] %></b></td>
            </tr>
               <tr>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><span><b>SHIPPER </b></span></td>
                <td colspan="4" class="cizgi orta baslik" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><b>CONSIGNEE</b></a></td>
            </tr>
             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=baslik[6] %></b> </span></td>
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
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal3" style="color:black;text-decoration:none"> <%=baslikdetay[9] %>:</a></b></span></td>
               <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3]%></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"> <b> <a href="#" data-toggle="modal" data-target="#myModal4" style="color:black;text-decoration:none"><%=baslikdetay[10] %>:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><%=baslikdetay[4] %></b> </td>
            </tr>
           
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>FAX:</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[5] %></b> </td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi" ><b><a href="#" data-toggle="modal" data-target="#myModal5" style="color:black;text-decoration:none"> <%=baslikdetay[12] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=email %></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal6" style="color:black;text-decoration:none"> <%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>

                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span><b style="font-size:11px;"><a href="#" data-toggle="modal" data-target="#myModal7" style="color:black;text-decoration:none"> <%=baslikdetay[14] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[5] %></b></td>
            </tr>

           <tr>
                <td colspan="8" class="cizgi sol baslik" style="height:25px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#staticBackdrop2">NOTIFIY</a> </b></span></td>
            </tr>
           
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b>
                    
                 <%
                    if (notifiy[0].Length >= 1)
                    {
                        %>
                        
                        <%=notifiy[0] %>&nbsp;
                    <%}
                    if (notifiy[1].Length >= 1)
                    {
                        %>
                        Address:
                        <%=notifiy[1] %>&nbsp;
                    <%
                    }
                    if (notifiy[2].Length >= 1)
                    {
                        %>
                        Country:
                        <%=notifiy[2] %>&nbsp;
                    <%
                    }
                    if (notifiy[4].Length >= 1)
                    {
                        %>
                         <%=notifiy[3] %>&nbsp;:
                        <%=notifiy[4] %>&nbsp;
                    <%
                    }
                    if (notifiy[6].Length >= 1)
                    {
                        %>
                         <%=notifiy[5] %>&nbsp;:
                        <%=notifiy[6] %>&nbsp;
                    <%
                    }
                    if (notifiy[8].Length >= 1)
                    {
                        %>
                         <%=notifiy[7] %>&nbsp;:
                        <%=notifiy[8] %>&nbsp;
                    <%
                    }
                    if (notifiy[10].Length >= 1)
                    {
                        %>
                         <%=notifiy[9] %>&nbsp;:
                        <%=notifiy[10] %>&nbsp;
                    <%
                    }
                    if (notifiy[12].Length >= 1)
                    {
                        %>
                         <%=notifiy[11] %>&nbsp;:
                        <%=notifiy[12] %>&nbsp;
                    <%
                    }
                    if (notifiy[14].Length >= 1)
                    {
                        %>
                         <%=notifiy[13] %>&nbsp;:
                        <%=notifiy[14] %>&nbsp;
                    <%
                    }
                        %>
                    
                    
   




                                                                                                        </b></span></td>
            </tr>
   
     
       <tr>
         <td colspan="8" class="baslik cizgi orta" style="height:30px;"><b> <a href="#"  style="color:black; text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-lg"><%=kontipi[0] %>&nbsp;OLARAK DUZENLENECEKTIR</a></b></td>
        </tr>
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                     int kolonsayisi = 1;
                     int enbuyuk = 0;
                     SqlCommand fcl1 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 1 and 13", con);
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "'  and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' ", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                  <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SPECODE=o.SPECODE  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                for (int i = kolonsayisi+1; i <= 13; i++)
                {%>
                            <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%
                    enbuyuk = i;
                }
                 %>  
     
              <tr>
                <td class="cizgi yaziboyutu orta" colspan="8" ><b>1</b></td>
             
            </tr>
        </table>
        
        <p style="page-break-before: always;">&nbsp;</p>
        <table class="table table-sm">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
     
     
      
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
               
                     SqlCommand fcl11 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 14 and 24", con);
                     SqlDataReader fcloku11 = fcl11.ExecuteReader();
                     while (fcloku11.Read())
                     {
                         if (Convert.ToInt32(fcloku11["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku11["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku11["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                            
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku11["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and kp.SPECODE=o.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                 for (int i = enbuyuk; i <= 26; i++)
                {%>
                            <tr>
                                <td  class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td  class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td  class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%}
                     
                 %>  
        
                    <%
                    int[] pallets = new int[1];
                        pallets[0] = 0;
                        double[] totaldegerler2 = new double[4];
                        totaldegerler2[0] = 0;
                        SqlCommand pcek2 = new SqlCommand("select COUNT(distinct k.FCLNO), case when o.Palet='YOK' then 0 when Palet <> 'YOK' then COUNT(distinct k.FCLNO)*20    end as Palet from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.SiparisTipi='Çoklu' group by o.Palet", con);
                       // pcek2.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader pp2 = pcek2.ExecuteReader();
                        while (pp2.Read())
                        {
                            totaldegerler2[0] = totaldegerler2[0] + Convert.ToInt32(pp2["Palet"]);
                        }
                        pp2.Close();

                        SqlCommand netttotal2 = new SqlCommand("select ISNULL(SUM(k.KonteynerdakiTonaj),0) as NET  from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu   and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "'", con);
                        totaldegerler2[1] = Convert.ToDouble(netttotal2.ExecuteScalar());

                        SqlCommand paletlericek2 = new SqlCommand("select CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int),0) when  REPLACE(o.Palet,'YOK',0) = 0 then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int),0)  END as PALET  from KonsimentoProduct kp left outer join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "'  and kp.SiparisTipi='Çoklu'  group by kp.FCLNO,o.Palet,o.BBAgirligi", con);
                        SqlDataReader paletlerioku2 = paletlericek2.ExecuteReader();
                        while(paletlerioku2.Read())
                        {
                            pallets[0] = pallets[0] + Convert.ToInt32(paletlerioku2["PALET"]);
                        }
                        paletlerioku2.Close();
                        SqlCommand fclfarklı2 = new SqlCommand("Konsimento_Gros_Total_Coklu", con);
                        fclfarklı2.Parameters.AddWithValue("@SPECODE", Request.QueryString["kod"]);
                        //totaldegerler[2] = totaldegerler[1] + (Convert.ToDouble(fclfarklı.ExecuteScalar()) * 30);
                        fclfarklı2.CommandType = CommandType.StoredProcedure;

                        SqlDataAdapter fclfarlioku = new SqlDataAdapter();
                        fclfarlioku.SelectCommand = fclfarklı2;
                        DataTable dtr = new DataTable();
                        fclfarlioku.Fill(dtr);
                        foreach (DataRow dr in dtr.Rows)
                        {
                            totaldegerler2[2] = totaldegerler2[2] + Convert.ToInt32(dr["BRUT"]);
                        }
                        
                     %>
    <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>TOTAL</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" colspan="2" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=pallets[0]%></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler2[1]) %></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler2[2]) %></b></td>
            </tr>
<tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                SqlCommand pakettipi44 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','PE Kraft'),'PE siz Kraft','Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where SPECODE=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi44.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader p44 = pakettipi44.ExecuteReader();
                        while (p44.Read())
                        {%>
                          <span><b><%=p44["Torba"].ToString() %>&nbsp;<%=p44["UniteAgirlik"].ToString() %>KGS &nbsp;<%=p44["BigBag"].ToString() %>&nbsp;<%=p44["Palet"].ToString() %>&nbsp;<%=p44["Strec"].ToString() %>&nbsp;(<%=p44["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%}
                 %>
                 </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF<br /><span class="kaydiryirmi">FCL</span> </a></span></b></td>
           <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span ><%=foot[7] %></span></b></td>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#mdl">SPECIAL NOTES</a></span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" data-toggle="modal" style="color:black;text-decoration:none" data-target=".bs-example-modal-sm">FREE<br /><span class="kaydiryirmi"> TIME</span></a> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=baslik[10] %></span></b></td>
                   <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="3" rowspan="4"><b><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;"><%=baslik[7]%></textarea></b></td>
            </tr>

            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN<br /><span class="kaydiryirmi"></span> OF<br /> <span class="kaydiryirmi">GOODS</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TURKEY</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF<br /><span class="kaydiryirmi">LOADING</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[1] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF<br /><span class="kaydiryirmi"> DELIVERY</span></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[2] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="text-decoration:none;color:black;" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>                       
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=kontipi[1] %>

                   <%
                if (kontipi[4] != "")
                {%>
                    &nbsp;/<%=kontipi[4] %>
                <%}
                if (kontipi[5] != "")
                {%>
                    &nbsp;/<%=kontipi[5] %>
                <%}
                if (kontipi[6] != "")
                {%>
                    &nbsp;/<%=kontipi[6] %>
                <%}
                      
                  %>
                                                                               </span></b></td>
                 <td class="cizgi yaziboyutu orta" colspan="3" rowspan="3" style="height:60px;"><b><span><asp:Image ID="Image2" Height="100" runat="server" /></span></b></td>
            </tr>

              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CLEAN<br /><span class="kaydiryirmi">ON</span> <br /><span class="orta kaydiryirmi">BOARD</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>FREIGHT &nbsp; <%=kontipi[2] %></span></b></td>
            </tr>
     <tr>
                <td class="cizgi yaziboyutu orta" colspan="8" ><b>2</b></td>
             
            </tr>
              
        </table>
          
         <%}
            else if (konsimentokayitsayisi > 24 && konsimentokayitsayisi <= 47)
            {%>
                 <table  class="table table-sm">
                <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
                {%>
                        <tr style="height: 18%;">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
          <tr>
                <td class="yaziboyutu" style="text-align: center"><span><b>Date :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=DateTime.Now.ToShortDateString() %></b></td>
                  <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center"><span><b>PO :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=kontipi[3] %></b></td>
            </tr>
               <tr>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><span><b>SHIPPER </b></span></td>
                <td colspan="4" class="cizgi orta baslik" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><b>CONSIGNEE</b></a></td>
            </tr>
             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=baslik[6] %></b> </span></td>
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
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal3" style="color:black;text-decoration:none"> <%=baslikdetay[9] %>:</a></b></span></td>
               <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3]%></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"> <b> <a href="#" data-toggle="modal" data-target="#myModal4" style="color:black;text-decoration:none"><%=baslikdetay[10] %>:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><%=baslikdetay[4] %></b> </td>
            </tr>
           
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>FAX:</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[5] %></b> </td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi" ><b><a href="#" data-toggle="modal" data-target="#myModal5" style="color:black;text-decoration:none"> <%=baslikdetay[12] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=email %></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal6" style="color:black;text-decoration:none"> <%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>

                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span><b style="font-size:11px;"><a href="#" data-toggle="modal" data-target="#myModal7" style="color:black;text-decoration:none"> <%=baslikdetay[14] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[5] %></b></td>
            </tr>

           <tr>
                <td colspan="8" class="cizgi sol baslik" style="height:25px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#staticBackdrop2">NOTIFIY</a> </b></span></td>
            </tr>
           
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b>
                    
                  <%
                    if (notifiy[0].Length >= 1)
                    {
                        %>
                        
                        <%=notifiy[0] %>&nbsp;
                    <%}
                    if (notifiy[1].Length >= 1)
                    {
                        %>
                        Address:
                        <%=notifiy[1] %>&nbsp;
                    <%
                    }
                    if (notifiy[2].Length >= 1)
                    {
                        %>
                        Country:
                        <%=notifiy[2] %>&nbsp;
                    <%
                    }
                    if (notifiy[4].Length >= 1)
                    {
                        %>
                         <%=notifiy[3] %>&nbsp;:
                        <%=notifiy[4] %>&nbsp;
                    <%
                    }
                    if (notifiy[6].Length >= 1)
                    {
                        %>
                         <%=notifiy[5] %>&nbsp;:
                        <%=notifiy[6] %>&nbsp;
                    <%
                    }
                    if (notifiy[8].Length >= 1)
                    {
                        %>
                         <%=notifiy[7] %>&nbsp;:
                        <%=notifiy[8] %>&nbsp;
                    <%
                    }
                    if (notifiy[10].Length >= 1)
                    {
                        %>
                         <%=notifiy[9] %>&nbsp;:
                        <%=notifiy[10] %>&nbsp;
                    <%
                    }
                    if (notifiy[12].Length >= 1)
                    {
                        %>
                         <%=notifiy[11] %>&nbsp;:
                        <%=notifiy[12] %>&nbsp;
                    <%
                    }
                    if (notifiy[14].Length >= 1)
                    {
                        %>
                         <%=notifiy[13] %>&nbsp;:
                        <%=notifiy[14] %>&nbsp;
                    <%
                    }
                        %>
                    
   




                                                                                                        </b></span></td>
            </tr>
   
     
       <tr>
         <td colspan="8" class="baslik cizgi orta" style="height:30px;"><b> <a href="#"  style="color:black; text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-lg"><%=kontipi[0] %>&nbsp;OLARAK DUZENLENECEKTIR</a></b></td>
        </tr>
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                     int kolonsayisi = 1;
                     SqlCommand fcl1 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 1 and 13", con);
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "'  and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE   where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' ", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                  <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                for (int i = kolonsayisi+1; i <= 13; i++)
                {%>
                            <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                
                           
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%}
                 %>  
     
              <tr>
                <td class="cizgi yaziboyutu orta" colspan="8" ><b>1</b></td>
             
            </tr>
        </table>
        
        <p style="page-break-before: always;">&nbsp;</p>
        <table class="table table-sm">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
     
     
      
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                int enbuyuk=0;
                     SqlCommand fcl11 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 14 and 30", con);
                     SqlDataReader fcloku11 = fcl11.ExecuteReader();
                     while (fcloku11.Read())
                     {
                         if (Convert.ToInt32(fcloku11["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku11["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style=" text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td  class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td  class="cizgi orta yaziboyutu"><b><%=fcloku11["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and  kp.SPECODE=o.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                            
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kp"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kp"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku11["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo  and kp.SPECODE=o.SPECODE where kp.SPECODE='" + Request.QueryString["kp"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo  and kp.SPECODE=o.SPECODE where kp.SPECODE='" + Request.QueryString["kp"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                 for (int i = enbuyuk; i <= 30; i++)
                {%>
                            <tr>
                                <td  class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td  class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td  class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%
                    enbuyuk = i;
                }
                     
                 %>  
        
                 
                 <tr>
                <td class="cizgi yaziboyutu orta" colspan="8" ><b>2</b></td>
             
            </tr>
        </table>


          <p style="page-break-before: always;">&nbsp;</p>
        <table class="table table-sm">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
     
     
      
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                
                     SqlCommand fcl12 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kp"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 31 and 45", con);
                     SqlDataReader fcloku12 = fcl12.ExecuteReader();
                     while (fcloku12.Read())
                     {
                         if (Convert.ToInt32(fcloku12["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku12["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku12["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                            
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku12["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE and k.SPECODE=o.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                 for (int i = enbuyuk; i <= 45; i++)
                {%>
                            <tr>
                                <td  class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td  class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td  class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%}
                     
                 %>  
        
                    <%
                    int[] pallets = new int[1];
                        pallets[0] = 0;
                        double[] totaldegerler2 = new double[4];
                        totaldegerler2[0] = 0;
                        SqlCommand pcek2 = new SqlCommand("select COUNT(distinct k.FCLNO), case when o.Palet='YOK' then 0 when Palet <> 'YOK' then COUNT(distinct k.FCLNO)*20    end as Palet from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.SiparisTipi='Çoklu' group by o.Palet", con);
                        pcek2.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader pp2 = pcek2.ExecuteReader();
                        while (pp2.Read())
                        {
                            totaldegerler2[0] = totaldegerler2[0] + Convert.ToInt32(pp2["Palet"]);
                        }
                        pp2.Close();

                        SqlCommand netttotal2 = new SqlCommand("select ISNULL(SUM(k.KonteynerdakiTonaj),0) as NET  from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "'", con);
                        totaldegerler2[1] = Convert.ToDouble(netttotal2.ExecuteScalar());

                        SqlCommand paletlericek2 = new SqlCommand("select CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int),0) when  REPLACE(o.Palet,'YOK',0) = 0 then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int),0)  END as PALET  from KonsimentoProduct kp left outer join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo where kp.SPECODE='" + Request.QueryString["kod"] + "'  and kp.SiparisTipi='Çoklu'  group by kp.FCLNO,o.Palet,o.BBAgirligi", con);
                        SqlDataReader paletlerioku2 = paletlericek2.ExecuteReader();
                        while(paletlerioku2.Read())
                        {
                            pallets[0] = pallets[0] + Convert.ToInt32(paletlerioku2["PALET"]);
                        }
                        paletlerioku2.Close();
                        SqlCommand fclfarklı2 = new SqlCommand("Konsimento_Gros_Total_Coklu", con);
                        fclfarklı2.Parameters.AddWithValue("@SPECODE", Request.QueryString["kod"]);
                        //totaldegerler[2] = totaldegerler[1] + (Convert.ToDouble(fclfarklı.ExecuteScalar()) * 30);
                        fclfarklı2.CommandType = CommandType.StoredProcedure;

                        SqlDataAdapter fclfarlioku = new SqlDataAdapter();
                        fclfarlioku.SelectCommand = fclfarklı2;
                        DataTable dtr = new DataTable();
                        fclfarlioku.Fill(dtr);
                        foreach (DataRow dr in dtr.Rows)
                        {
                            totaldegerler2[2] = totaldegerler2[2] + Convert.ToInt32(dr["BRUT"]);
                        }
                        
                     %>
    <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>TOTAL</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" colspan="2" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=pallets[0]%></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler2[1]) %></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler2[2]) %></b></td>
            </tr>
<tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                SqlCommand pakettipi44 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','PE Kraft'),'PE siz Kraft','Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where SPECODE=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi44.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader p44 = pakettipi44.ExecuteReader();
                        while (p44.Read())
                        {%>
                          <span><b><%=p44["Torba"].ToString() %>&nbsp;<%=p44["UniteAgirlik"].ToString() %>KGS &nbsp;<%=p44["BigBag"].ToString() %>&nbsp;<%=p44["Palet"].ToString() %>&nbsp;<%=p44["Strec"].ToString() %>&nbsp;(<%=p44["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%}
                 %>
                 </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF<br /><span class="kaydiryirmi">FCL</span> </a></span></b></td>
           <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span ><%=foot[7] %></span></b></td>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#mdl">SPECIAL NOTES</a></span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" data-toggle="modal" style="color:black;text-decoration:none" data-target=".bs-example-modal-sm">FREE<br /><span class="kaydiryirmi"> TIME</span></a> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=baslik[10] %></span></b></td>
                   <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="3" rowspan="4"><b><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;"><%=baslik[7]%></textarea></b></td>
            </tr>

            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN<br /><span class="kaydiryirmi"></span> OF<br /> <span class="kaydiryirmi">GOODS</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TURKEY</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF<br /><span class="kaydiryirmi">LOADING</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[1] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF<br /><span class="kaydiryirmi"> DELIVERY</span></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[2] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="text-decoration:none;color:black;" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>                       
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=kontipi[1] %>

                   <%
                if (kontipi[4] != "")
                {%>
                    &nbsp;/<%=kontipi[4] %>
                <%}
                if (kontipi[5] != "")
                {%>
                    &nbsp;/<%=kontipi[5] %>
                <%}
                if (kontipi[6] != "")
                {%>
                    &nbsp;/<%=kontipi[6] %>
                <%}
                      
                  %>
                                                                               </span></b></td>
                 <td class="cizgi yaziboyutu orta" colspan="3" rowspan="3" style="height:60px;"><b><span><asp:Image ID="Image3" Height="100" runat="server" /></span></b></td>
            </tr>

              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CLEAN<br /><span class="kaydiryirmi">ON</span> <br /><span class="orta kaydiryirmi">BOARD</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>FREIGHT &nbsp; <%=kontipi[2] %></span></b></td>
            </tr>
    
                 <tr>
                <td class="cizgi yaziboyutu orta" colspan="8" ><b>3</b></td>
             
            </tr>
        </table>

            <%}

            else if (konsimentokayitsayisi > 47 && konsimentokayitsayisi <= 60)
            {%>
                 <table  class="table table-sm">
                <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
                {%>
                        <tr style="height: 18%;">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
        <tr>
                <td class="yaziboyutu" style="text-align: center"><span><b>Date :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=DateTime.Now.ToShortDateString() %></b></td>
                  <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center">&nbsp;</td>
                <td style=" text-align: left" class="yaziboyutu">&nbsp;</td>
              <td class="yaziboyutu" style="text-align: center"><span><b>PO :</b> </span></td>
                <td style=" text-align: left" class="yaziboyutu"><b> <%=kontipi[3] %></b></td>
            </tr>
               <tr>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><span><b>SHIPPER </b></span></td>
                <td colspan="4" class="cizgi orta baslik" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><b>CONSIGNEE</b></a></td>
            </tr>
             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=baslik[6] %> </b> </span></td>
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
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal3" style="color:black;text-decoration:none"> <%=baslikdetay[9] %>:</a></b></span></td>
               <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3]%></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"> <b> <a href="#" data-toggle="modal" data-target="#myModal4" style="color:black;text-decoration:none"><%=baslikdetay[10] %>:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><%=baslikdetay[4] %></b> </td>
            </tr>
           
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>FAX:</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[5] %></b> </td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi" ><b><a href="#" data-toggle="modal" data-target="#myModal5" style="color:black;text-decoration:none"> <%=baslikdetay[12] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=email %></b></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#myModal6" style="color:black;text-decoration:none"> <%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>

                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="2" style="width:200px;height:15px;"><span><b style="font-size:11px;"><a href="#" data-toggle="modal" data-target="#myModal7" style="color:black;text-decoration:none"> <%=baslikdetay[14] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b> <%=baslikdetay[5] %></b></td>
            </tr>

           <tr>
                <td colspan="8" class="cizgi sol baslik" style="height:25px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#staticBackdrop2">NOTIFIY</a> </b></span></td>
            </tr>
           
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b>
                    
                     <%
                    if (notifiy[0].Length >= 1)
                    {
                        %>
                        
                        <%=notifiy[0] %>&nbsp;
                    <%}
                    if (notifiy[1].Length >= 1)
                    {
                        %>
                        Address:
                        <%=notifiy[1] %>&nbsp;
                    <%
                    }
                    if (notifiy[2].Length >= 1)
                    {
                        %>
                        Country:
                        <%=notifiy[2] %>&nbsp;
                    <%
                    }
                    if (notifiy[4].Length >= 1)
                    {
                        %>
                         <%=notifiy[3] %>&nbsp;:
                        <%=notifiy[4] %>&nbsp;
                    <%
                    }
                    if (notifiy[6].Length >= 1)
                    {
                        %>
                         <%=notifiy[5] %>&nbsp;:
                        <%=notifiy[6] %>&nbsp;
                    <%
                    }
                    if (notifiy[8].Length >= 1)
                    {
                        %>
                         <%=notifiy[7] %>&nbsp;:
                        <%=notifiy[8] %>&nbsp;
                    <%
                    }
                    if (notifiy[10].Length >= 1)
                    {
                        %>
                         <%=notifiy[9] %>&nbsp;:
                        <%=notifiy[10] %>&nbsp;
                    <%
                    }
                    if (notifiy[12].Length >= 1)
                    {
                        %>
                         <%=notifiy[11] %>&nbsp;:
                        <%=notifiy[12] %>&nbsp;
                    <%
                    }
                    if (notifiy[14].Length >= 1)
                    {
                        %>
                         <%=notifiy[13] %>&nbsp;:
                        <%=notifiy[14] %>&nbsp;
                    <%
                    }
                        %>
                    
                    
   




                                                                                                        </b></span></td>
            </tr>
     
       <tr>
         <td colspan="8" class="baslik cizgi orta" style="height:30px;"><b> <a href="#"  style="color:black; text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-lg"><%=kontipi[0] %>&nbsp;OLARAK DUZENLENECEKTIR</a></b></td>
        </tr>
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                     int kolonsayisi = 1;
                     SqlCommand fcl1 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 1 and 13", con);
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "'  and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' ", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                  <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                for (int i = kolonsayisi+1; i <= 13; i++)
                {%>
                            <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                
                           
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%}
                 %>  
     
              <tr>
                <td class="cizgi yaziboyutu orta" style="height:10px;" colspan="8" ><b>1</b></td>
             
            </tr>
        </table>
        
        <p style="page-break-before: always;">&nbsp;</p>
        <table class="table table-sm">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
     
     
      
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                int enbuyuk=0;
                     SqlCommand fcl11 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 14 and 30", con);
                     SqlDataReader fcloku11 = fcl11.ExecuteReader();
                     while (fcloku11.Read())
                     {
                         if (Convert.ToInt32(fcloku11["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku11["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style=" text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td  class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td  class="cizgi orta yaziboyutu"><b><%=fcloku11["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                            
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku11["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku11["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                 for (int i = enbuyuk; i <= 30; i++)
                {%>
                            <tr>
                                <td  class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td  class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td  class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%
                    enbuyuk = i;
                }
                     
                 %>  
        
                    <tr>
               <td class="cizgi yaziboyutu orta" style="height:10px;" colspan="8" ><b>2</b></td>
             
            </tr>
              
        </table>


          <p style="page-break-before: always;">&nbsp;</p>
        <table class="table table-sm">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
     
     
      
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                
                     SqlCommand fcl12 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 31 and 45", con);
                     SqlDataReader fcloku12 = fcl12.ExecuteReader();
                     while (fcloku12.Read())
                     {
                         if (Convert.ToInt32(fcloku12["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku12["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku12["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                            
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE  where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku12["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE  where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku12["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                 for (int i = enbuyuk; i <= 45; i++)
                {%>
                            <tr>
                                <td  class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td  class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td  class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%}
                     
                 %>  
        
                   
       <tr>
                <td class="cizgi yaziboyutu orta" style="height:10px;" colspan="8" ><b>3</b></td>
             
            </tr>
              
        </table>
         <p style="page-break-before: always;">&nbsp;</p>




        <table class="table table-sm">
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
                <td colspan="8" style="text-align: center; font-size: 22px; height: 22px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 18px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=booking.ToString() %></a></b></td>
              </tr>
     
     
      
                         <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b><a href="KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="color:black;text-decoration:none;"> PRODUCT</a></b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIGHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                
                     SqlCommand fcl13 = new SqlCommand("with myResult(sira,Sayi,FCLNO)as(select ROW_NUMBER() OVER( order by FCLNO) as sira, COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where SPECODE='" + Request.QueryString["kod"] + "' and SiparisTipi='Çoklu' group by FCLNO)select *from myResult where sira between 45 and 60", con);
                     SqlDataReader fcloku13 = fcl13.ExecuteReader();
                     while (fcloku13.Read())
                     {
                         if (Convert.ToInt32(fcloku13["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku13["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE  where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu,o.Id order by o.Id asc", con);
                             SqlDataReader paketoku = paketcek.ExecuteReader();
                             while (paketoku.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku13["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netbrutoku["NET"])+Convert.ToInt32(netbrutoku["BRUT"]) %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                            
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
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu' group by k.FCLNO,o.UrunAnaGrup,o.Urun,o.Id order by o.Id asc", con);
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
                                            
                            
                             SqlCommand paketcek = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+REPLACE(REPLACE(o.TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu", con);
                                                 SqlDataReader paketoku = paketcek.ExecuteReader();
                                                 while (paketoku.Read())
                                                 {%>
                                         <b><span><%=paketoku["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku["Torba"].ToString() %></span>&nbsp;<span><%=paketoku["BigBag"].ToString() %></span>&nbsp;<%=paketoku["Palet"].ToString()%>&nbsp;<%=paketoku["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku13["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int) when  REPLACE(o.Palet,'YOK',0) = 0 then CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int)  END AS PALET   from KonsimentoProduct kp inner join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by kp.FCLNO,o.Palet,o.BBAgirligi,o.Id order by o.Id asc", con);
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
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and k.SiparisTipi='Çoklu'", con);
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
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(kp.KonteynerdakiTonaj) as decimal(18,0)) as NET,case   when o.Palet <> 'YOK' then CAST(SUM(PaletSayisi*30) as int) when o.Palet ='YOK' then CAST(SUM(PaletSayisi*10) as int) end as BRUT   from KonsimentoProduct kp inner join Orders o on  o.YediyuzluKod=kp.MamulKodu and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "' and kp.FCLNO='" + fcloku13["FCLNO"].ToString() + "' and kp.SiparisTipi='Çoklu' group by o.Palet,o.BBAgirligi", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        netvebrut[1] = Convert.ToInt32(netbrutoku["BRUT"]) + netvebrut[1];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                    
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if (kolonsayisi > enbuyuk)
                                 enbuyuk = kolonsayisi;
                             
                             if(paletbilgisi[0]=="PALETLİ")
                                 //netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(netvebrut[1])+Convert.ToInt32(netvebrut[0]) %></b></td>
                                </tr>
                         <%}
                     }
                 for (int i = enbuyuk; i <= 60; i++)
                {%>
                            <tr>
                                <td  class="cizgi orta yaziboyutu"><b><%=i %></b></td>
                                
                           
                                         <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                               
                                         <td  class="cizgi orta yaziboyutu"> &nbsp;</td>
                               
                               
                                <td class="cizgi orta yaziboyutu"><b>&nbsp;</b> </td>
                             
                                          <td  class="cizgi orta yaziboyutu"> <b>&nbsp;</b></td>
                                 
                                         <td class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                               
                                         
                                    <td  class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                                        <td  class="cizgi orta yaziboyutu">&nbsp;</td>
                                    
                        
                                   
                                </tr>
                <%}
                     
                 %>  
        
                    <%
                    int[] pallets = new int[1];
                        pallets[0] = 0;
                        double[] totaldegerler2 = new double[4];
                        totaldegerler2[0] = 0;
                        SqlCommand pcek2 = new SqlCommand("select COUNT(distinct k.FCLNO), case when o.Palet='YOK' then 0 when Palet <> 'YOK' then COUNT(distinct k.FCLNO)*20    end as Palet from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "' and k.SiparisTipi='Çoklu' group by o.Palet", con);
                        pcek2.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader pp2 = pcek2.ExecuteReader();
                        while (pp2.Read())
                        {
                            totaldegerler2[0] = totaldegerler2[0] + Convert.ToInt32(pp2["Palet"]);
                        }
                        pp2.Close();

                        SqlCommand netttotal2 = new SqlCommand("select ISNULL(SUM(k.KonteynerdakiTonaj),0) as NET  from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  and k.SiparisNo=o.SiparisNo and o.SPECODE=k.SPECODE where o.SPECODE='" + Request.QueryString["kod"] + "'", con);
                        totaldegerler2[1] = Convert.ToDouble(netttotal2.ExecuteScalar());

                        SqlCommand paletlericek2 = new SqlCommand("select CASE  when REPLACE(o.Palet,'YOK',0) <> 0  then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.Palet as int) AS int),0) when  REPLACE(o.Palet,'YOK',0) = 0 then ISNULL(CAST(SUM(kp.KonteynerdakiTonaj)/CAST(o.BBAgirligi as int) AS int),0)  END as PALET  from KonsimentoProduct kp left outer join Orders o on  kp.MamulKodu=o.YediyuzluKod and kp.SiparisNo=o.SiparisNo and o.SPECODE=kp.SPECODE where kp.SPECODE='" + Request.QueryString["kod"] + "'  and kp.SiparisTipi='Çoklu'  group by kp.FCLNO,o.Palet,o.BBAgirligi", con);
                        SqlDataReader paletlerioku2 = paletlericek2.ExecuteReader();
                        while(paletlerioku2.Read())
                        {
                            pallets[0] = pallets[0] + Convert.ToInt32(paletlerioku2["PALET"]);
                        }
                        paletlerioku2.Close();
                        SqlCommand fclfarklı2 = new SqlCommand("Konsimento_Gros_Total_Coklu", con);
                        fclfarklı2.Parameters.AddWithValue("@SPECODE", Request.QueryString["kod"]);
                        //totaldegerler[2] = totaldegerler[1] + (Convert.ToDouble(fclfarklı.ExecuteScalar()) * 30);
                        fclfarklı2.CommandType = CommandType.StoredProcedure;

                        SqlDataAdapter fclfarlioku = new SqlDataAdapter();
                        fclfarlioku.SelectCommand = fclfarklı2;
                        DataTable dtr = new DataTable();
                        fclfarlioku.Fill(dtr);
                        foreach (DataRow dr in dtr.Rows)
                        {
                            totaldegerler2[2] = totaldegerler2[2] + Convert.ToInt32(dr["BRUT"]);
                        }
                        
                     %>
    <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>TOTAL</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" colspan="2" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=pallets[0]%></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler2[1]) %></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler2[2]) %></b></td>
            </tr>
<tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                SqlCommand pakettipi44 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','PE Kraft'),'PE siz Kraft','Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where SPECODE=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi44.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                        SqlDataReader p44 = pakettipi44.ExecuteReader();
                        while (p44.Read())
                        {%>
                          <span><b><%=p44["Torba"].ToString() %>&nbsp;<%=p44["UniteAgirlik"].ToString() %>KGS &nbsp;<%=p44["BigBag"].ToString() %>&nbsp;<%=p44["Palet"].ToString() %>&nbsp;<%=p44["Strec"].ToString() %>&nbsp;(<%=p44["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%}
                 %>
                 </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF<br /><span class="kaydiryirmi">FCL</span> </a></span></b></td>
           <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span ><%=foot[7] %></span></b></td>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#mdl">SPECIAL NOTES</a></span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" data-toggle="modal" style="color:black;text-decoration:none" data-target=".bs-example-modal-sm">FREE<br /><span class="kaydiryirmi"> TIME</span></a> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=baslik[10] %></span></b></td>
                   <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="3" rowspan="4"><b><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;"><%=baslik[7]%></textarea></b></td>
            </tr>

            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN<br /><span class="kaydiryirmi"></span> OF<br /> <span class="kaydiryirmi">GOODS</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TURKEY</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF<br /><span class="kaydiryirmi">LOADING</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[1] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF<br /><span class="kaydiryirmi"> DELIVERY</span></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[2] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="text-decoration:none;color:black;" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>                       
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=kontipi[1] %>

                   <%
                if (kontipi[4] != "")
                {%>
                    &nbsp;/<%=kontipi[4] %>
                <%}
                if (kontipi[5] != "")
                {%>
                    &nbsp;/<%=kontipi[5] %>
                <%}
                if (kontipi[6] != "")
                {%>
                    &nbsp;/<%=kontipi[6] %>
                <%}
                      
                  %>
                                                                               </span></b></td>
                 <td class="cizgi yaziboyutu orta" colspan="3" rowspan="3" style="height:60px;"><b><span><asp:Image ID="Image4" Height="100" runat="server" /></span></b></td>
            </tr>

              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CLEAN<br /><span class="kaydiryirmi">ON</span> <br /><span class="orta kaydiryirmi">BOARD</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>FREIGHT &nbsp; <%=kontipi[2] %></span></b></td>
            </tr>
    
                 <tr>
                <td class="cizgi yaziboyutu orta" style="height:10px;" colspan="8" ><b>4</b></td>
             
            </tr>
        </table>

            <%}
           
            
             %>


        <% SqlConnection.ClearPool(con); %>
    </div>
<asp:Panel ID="pnl2" runat="server">
   <div style="text-align: center;height:10px;">
       <asp:Button ID="btnPDF" Text="PDF" runat="server" OnClick="btnPDF_Click" CssClass="btn btn-warning" BackColor="Orange" ForeColor="White" Height="40px" />
     <a href="OperationKonsimento.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
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



