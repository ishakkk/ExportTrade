<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeklifFormu.aspx.cs" Inherits="ExternalTrade.TeklifFormu" %>
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
      
    <%-- <link href="assets/css/bootstrap.min.css" rel="stylesheet" />--%>
     <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet">
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
      <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script src="assets/js/pages/sweet-alerts.init.js"></script>
    <script src="jquery-3.6.0.min.js"></script>
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

        .auto-style1 {
            height: 40px;
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
        function MoneyText() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
            }).then(function () { window.location = 'TeklifFormu.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
        }
        function paymentSuccess() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "ÖDEME TİPİ GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'TeklifFormu.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
}
function paymentError() {
    swal({
        title: "İŞLEM TAMAMLANAMADI", text: "ÖDEME TİPİ GÜNCELLENEMEDİ", type: "error"
    });
}


function varisSuccess() {
    swal({
        title: "İŞLEM TAMAMLANDI", text: "Varış Limanı Güncellendi", type: "success"
    }).then(function () { window.location = 'TeklifFormu.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
        }
        function varisError() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Varış Limanı Güncellenemdi", type: "error"
            });
        }


        function cSuccess() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Müşteri Bilgileri Güncellendi", type: "success"
            }).then(function () { window.location = 'TeklifFormu.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
}
function cError() {
    swal({
        title: "İŞLEM TAMAMLANAMADI", text: "Müşteri Bilgileri Güncellenemedi", type: "error"
    });
}

    </script>
    
    </head>
<body>
    <form id="form1" runat="server">
         <asp:Panel ID="pnl1" runat="server">
       <div style="text-align: center;height:10px;">
          
    </div>
         </asp:Panel>
 

          <!-- /.modal -->
        
         <!-- /.modal -->
            
    <div id="pdf">
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
           <div class="modal fade" id="myModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">CONSIGNEE INFORMATION</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                               <p> Contact Person</p>
                                                <p><asp:TextBox ID="txtContactPerson" CssClass="form-control" runat="server"></asp:TextBox></p>
                                                    <p> Contact Email</p>
                                                <p><asp:TextBox ID="txtContactEmail" CssClass="form-control" runat="server"></asp:TextBox></p>
                                                    <p>Phone Number</p>
                                                <p><asp:TextBox ID="txtPhoneNumber" CssClass="form-control" runat="server"></asp:TextBox></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                                <%--<button type="button" class="btn btn-primary">Save</button>--%>
                                                <asp:Button ID="Button2" runat="server"  OnClick="Button2_Click" Text="GÜNCELLE" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                        </div>
                                    </div>
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

            string[] paket = new string[10];
            string[] foot = new string[20];
            double[] paletagirlik = new double[1];
            double QTY = 0;
            int[] konteynersayisi = new int[1];
            double toplamfiyat = 0;
            paletagirlik[0] = 0;
            SqlCommand vadecek = new SqlCommand("select Vade from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "' group by Vade", con);

            int kayitsayisi;
            SqlCommand konteynersayisicek = new SqlCommand("select  SUM(distinct SiparistekiKonteynerSayisi)  from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            konteynersayisi[0] = Convert.ToInt32(konteynersayisicek.ExecuteScalar());
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
                baslik[7] = baslikoku["USDKUR"].ToString();
                baslik[8] = baslikoku["EUROKUR"].ToString();

            }
            baslikoku.Close();



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
            SqlCommand mamulsayisi = new SqlCommand("select COUNT(mamul.NAME) from Orders o left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on o.YediyuzluKod=mamul.CODE where o.Durum='SATISA DONDU' and mamul.NAME is not null and o.TeklifNo=@p1", con);
            mamulsayisi.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            sayac = Convert.ToInt32(mamulsayisi.ExecuteScalar());
            sayac = esikdeger - sayac;
            SqlCommand foott = new SqlCommand("select CustomClerance, KonteynerBulkSecimi, REPLACE(REPLACE(o.Vade,'Peşin','CASH IN ADVANCE'),'Gün','DAYS AFTER B/L') as Vade,case when o.KalkisLimani='MIP' Then 'MIP (MERSIN INTERNATIONAL PORT)' when o.KalkisLimani='Limak' then 'ISKENDERUN LIMAK' when KalkisLimani='YOK' then '' end as KalkisLimani,UPPER(REPLACE(o.VarisLimani,'YOK','')) as VarisLimani,REPLACE(o.TeklifTipi,'YOK','') as TeklifTipi,CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,0)) as MIKTAR,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int) as Konteyner,case when KalkisLimani='MIP' then 'MERSIN' when KalkisLimani='Limak' then 'ISKENDERUN'   end as Sehir,case  when EkipmanTuru='40 DV' then  CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 40 HC' when EkipmanTuru='20 DV' then CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 20 DC'  end as Ekipman, case when EkipmanTuru='20 DV' then 20*30 when EkipmanTuru='40 DV' then 40*30 else 0 end as Gross,FobVisible,v. ValidityText,Explanation,PaymentTerms  from Orders o inner join Validity v on o.TeklifTipi=v.TeklifTipi  where TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Vade,o.KalkisLimani,o.VarisLimani,o.TeklifTipi,o.EkipmanTuru,o.FobVisible,o.Explanation,o.PaymentTerms,o.KonteynerBulkSecimi,v.ValidityText,CustomClerance", con);
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
                foot[11] = footer["ValidityText"].ToString();
                foot[12] = footer["Explanation"].ToString();
                foot[13] = footer["PaymentTerms"].ToString();
                foot[14] = footer["KonteynerBulkSecimi"].ToString();
                foot[15] = footer["CustomClerance"].ToString();
            }

            footer.Close();
            SqlCommand foott2 = new SqlCommand("select MoneyText from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            SqlDataReader footer2 = foott2.ExecuteReader();
            while (footer2.Read())
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
            SqlCommand baslikdetaycek = new SqlCommand("select MusteriIsmi,IletisimeGecilecekKisi,MüşteriEmail,MüşteriTelNo,VarisLimani,Info,TDS,MSDS  from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "' group by MusteriIsmi,IletisimeGecilecekKisi,MüşteriEmail,MüşteriTelNo,VarisLimani,Info,TDS,MSDS", con);
            baslikdetaycek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader baslikdetayoku = baslikdetaycek.ExecuteReader();
            while (baslikdetayoku.Read())
            {
                baslikdetay[0] = baslikdetayoku["MusteriIsmi"].ToString();
                baslikdetay[1] = baslikdetayoku["IletisimeGecilecekKisi"].ToString();
                baslikdetay[2] = baslikdetayoku["MüşteriEmail"].ToString();
                baslikdetay[3] = baslikdetayoku["MüşteriTelNo"].ToString();
                baslikdetay[4] = baslikdetayoku["VarisLimani"].ToString();
                baslikdetay[5] = baslikdetayoku["Info"].ToString();
                baslikdetay[6] = baslikdetayoku["TDS"].ToString();
                baslikdetay[7] = baslikdetayoku["MSDS"].ToString();
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
             <%
           
                 if (Convert.ToBoolean(baslikdetay[5]) == true)
                 {%>
                    <img src="INFO/1.jpg" width="1100" class="tds" />
                    <img src="INFO/2.jpg"  width="1100" class="tds" />
        <img src="INFO/3.jpg"  width="1100" class="tds" />
        <img src="INFO/4.jpg"  width="1100" class="tds" />
        <img src="INFO/5.jpg"  width="1100" class="tds" />
        <img src="INFO/6.jpg"  width="1100" class="tds" /><br /><br />
       
     
                <%}
                  
                 if (Convert.ToBoolean(baslikdetay[6]) == true)
                 {
                    
                     SqlCommand inf = new SqlCommand("select distinct p.Tds from Orders o inner join Product p on o.UrunKodu=p.Code where TeklifNo=@p1", con);
                     inf.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                     SqlDataReader dr = inf.ExecuteReader();
                     while (dr.Read())
                     {%>
                        <img src="<%=dr["Tds"].ToString() %>" class="tds" />
          
                     <%}

                     dr.Close();

                 }
          
                    
            %>
       
        <br /><br /><br />
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
                                                          
                                                          SqlConnection con3 = new SqlConnection(strcon);
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
                                                        <asp:Button ID="Button10" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="Button10_Click"  />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
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
                                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="Button1_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
        <div>
        <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                       else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}                       %>>

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
                <td colspan="7" style="text-align: center; font-size: 20px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>İLHANLI MAHALLESİ MOZAİKÇİLER KÜME KM EVLERİ<br />NİĞTAŞ A.BLOK NO:1/G/1 MERKEZ NİĞDE-51000/TÜRKİYE</b></span></td>
            </tr>
            <tr>
                <td colspan="7" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>QUOTATION</b></span></td>
            </tr>
              <tr>
                   <td class="cizgi yaziboyutu" colspan="7" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-center">QUOTATION NUMBER:</a></b></span>&nbsp;<b><span><%=Request.QueryString["TeklifNo"] %></span></b><span class="kaydiryirmi"><b>&nbsp;</b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></span></td>
            </tr>
                <tr>
                <td colspan="4" class="cizgi orta" style="width:600px; height:25px;"><span><b>SELLER INFORMATION</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"> CONSIGNEE INFORMATION</a></b></td>
            </tr>

                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>NAME</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="width:400px;height:15px;"><b><%=ExternalTrade.Classes.UserData.Name+" "+ExternalTrade.Classes.UserData.SurName %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>COMPANY NAME:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=baslikdetay[0] %></b></td>
            </tr>
     
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TITLE:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b><%=ExternalTrade.Classes.UserData.Position %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>CONTACT PERSON:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=baslikdetay[1] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px; font-size:11px;"><span class="kaydiryirmi" ><b>PHONE NUMBER:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="width:400px;height:15px;"><b><%=ExternalTrade.Classes.UserData.Contact %></b></td>
                 <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>CONTACT EMAIL</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[2] %></b> </td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> EMAIL:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=ExternalTrade.Classes.UserData.Email %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>PHONE NUMBER:</b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b>  <%=baslikdetay[3] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEB SITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="3"><b><a href="https://www.nigtas.com/" style="text-decoration:none; color:black;">www.nigtas.com</a> </b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> DESTINATION:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b>  <%=baslikdetay[4] %></b></td>
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
                else if (baslik[4] == "TL")
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
                        cmd.Parameters.AddWithValue("@dolarkuru",Convert.ToDouble(baslik[7]));
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
                            kayitsira++; toplamfiyat = toplamfiyat + Convert.ToDouble(dr["Total2"]);
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
                        alt.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[7]));
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
                            kayitsira++; toplamfiyat = toplamfiyat + Convert.ToDouble(dr["Total2"]);
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
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[7]));
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
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> ₺<%=toplamfiyat.ToString("n2") %></b></span></td>
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
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> €<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                      

                } 
                
                
                
                
            %>
                    
                        
       

            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="6">
                  <%
                      SqlCommand pakettipi = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','PE Kraft'),'PE siz Kraft','Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                      pakettipi.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                      SqlDataAdapter da4 = new SqlDataAdapter();
                      da4.SelectCommand = pakettipi;
                      DataTable dt4 = new DataTable();
                      da4.Fill(dt4);
                      foreach (DataRow p in dt4.Rows)
                      {%>
                          <span><b><%=p["Torba"].ToString() %>&nbsp;&nbsp;<%=p["UniteAgirlik"].ToString() +"KGS"%>&nbsp;&nbsp;<%=p["BigBag"].ToString() %>&nbsp;<%=p["Palet"].ToString() %>&nbsp;<%=p["Strec"].ToString() %>&nbsp;(<%=p["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%
                          
                      }
                 %>
              </td>
                 
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="6">
                  <%
                      SqlCommand unit = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+15 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                      SqlDataAdapter da5 = new SqlDataAdapter();
                      da5.SelectCommand = unit;
                      DataTable dt5 = new DataTable();
                      da5.Fill(dt5);

                      foreach (DataRow un in dt5.Rows)
                      {%>
                          <span><b><%=un["UniteAgirlik"].ToString()%>&nbsp;KGS NET WEIGHT</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un["Brut"].ToString() %> KGS GROSS WEIGHT</b></span>
                          <br />
                      <%}                                                        
                                                                                  
                  %></td>
               <%--  <td class="cizgi yaziboyutu" colspan="2" rowspan="9" style="vertical-align:top"><b><span ><%=baslik[3] %></span></b></td>--%>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="6"><b><span><%=foot[4] %>&nbsp;KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                    
                         <span><b><%=brutagirlik_1 %>&nbsp;KGS GROSS WEIGHT</b></span>
                  
             
              </td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span> <%=foot[7] %></span></b></td>
                 <td class="cizgi yaziboyutu orta" colspan="2" rowspan="6"><b><span><asp:Image ID="img_yeri" runat="server"/></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlpayment">PAYMENT</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="4"><b><span><%=foot[13]  %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TÜRKİYE</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF LOADING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[1] %>/TÜRKİYE</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlkalkis">PORT OF DELIVERY</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[2] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">DELIVERY TERMS</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[3] %></span></b></td>
            </tr>
          
          <tr>
              <td class="cizgi yaziboyutu"><span class="kaydiryirmi"><b> VALIDITY</b></span></td>
             <td class="cizgi yaziboyutu" colspan="6"><span><b><%=foot[11] %></b></span></td>
          </tr>
             <tr>
              <td class="cizgi yaziboyutu"><span class="kaydiryirmi"><b>CUSTOM CLEARANCE</b></span></td>
             <td class="cizgi yaziboyutu" colspan="6"><span><b><%=foot[15] %></b></span></td>
          </tr>
               <tr>
              <td class="cizgi yaziboyutu"><span class="kaydiryirmi"><b>EXPLANATION</b> </span></td>
             <td class="cizgi yaziboyutu" colspan="6"><span><b><%=foot[12] %></b></span></td>
          </tr>
                </table>
      
       </div>
         <%SqlConnection.ClearPool(con); %>
    </div>
  <asp:Panel ID="pnl2" runat="server">
   <div style="text-align:center;height:10px;">
     

       
     <asp:Button ID="btnPDF" runat="server" Text="PDF" OnClick="btnPDF_Click" CssClass="btn btn-warning" BackColor="Orange" ForeColor="White" Height="40px" />
    <a href="OnaylananTeklifler.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
        </div>
        </asp:Panel>
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
    <%-- <%con.Close(); %>--%>
        </form>
</body>
</html>


