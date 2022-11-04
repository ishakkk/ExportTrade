<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UrunRaporlama.aspx.cs" Inherits="ExternalTrade.Admin.UrunRaporlama" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#urun tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <script>
        function fnExcelReport() {
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange; var j = 0;
            tab = document.getElementById('urunrapor'); // id of table

            for (j = 0 ; j < tab.rows.length ; j++) {
                tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                //tab_text=tab_text+"</tr>";
            }

            tab_text = tab_text + "</table>";
            tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
            tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
            tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
            {
                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
            }
            else                 //other browser not tested on IE 11
                sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));

            return (sa);
        }
    </script>

    <%
        int mozaik = 0, mozaikbeyaz = 0, granul = 0, granulkextra = 0, mikronizekalin = 0, mikronizeince = 0, mikronizeincekapli = 0, mikronize = 0, mikronizekapli = 0, nanometrik = 0, nanometrikkapli = 0, hidrofil = 0, hidrofilkapli = 0, talk = 0, barit = 0, ticari = 0;
        
    %>
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
            }).then(function () { window.location = 'UrunRaporlama.aspx' });
        }
    </script>
    <script>
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Rapor Oluşturulamadı", type: "error"
            }).then(function () { window.location = 'UrunRaporlama.aspx' });
        }
    </script>
    <div class="row">
        <div class="col-xl-12">
            <div class="card-box">
                <div>
                    BAŞLANGIÇ TARİHİ
                </div>
                <div>
                    <asp:TextBox ID="txttar1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    BİTİŞ TARİHİ
                </div>
                <div>
                    <asp:TextBox ID="txttar2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <br />

                <div>
                    <asp:Button ID="btnCek" runat="server" Text="Raporla" CssClass="btn btn-success" OnClick="btnCek_Click" Height="40px" />
                    <div style="float: right">
                        <input type="button" value="EXCEL RAPORU AL" class="btn btn-primary" style="height: 40px;" onclick="fnExcelReport()" />
                    </div>
                </div>

            </div>


            <!-- end col-->
            <%
                if (Session["urunbaslangic"] != null && Session["urunbaslangic"] != "")
                {
                    if (Session["urunbitis"] != null && Session["urunbitis"] != "")
                    {

                        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;
                        SqlConnection con = new SqlConnection(strcon);
                        con.Open();


                        SqlCommand mozaikcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='03.MOZAİK' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mozaikcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mozaikcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));

                        SqlCommand mozaikbeyazcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='04.MOZAİK BEYAZ' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mozaikbeyazcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mozaikbeyazcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand granulcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='05.GRANÜL' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        granulcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        granulcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand granulextracek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='06.GRANÜL EXTRA' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        granulextracek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        granulextracek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand mikronizekalincek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='07.MİKRONİZE KALIN' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mikronizekalincek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mikronizekalincek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand mikronizeincecek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='08.MİKRONİZE İNCE' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mikronizeincecek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mikronizeincecek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand mikronizeincekaplicek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='09.MİKRONİZE İNCE KAPLI' and  SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mikronizeincekaplicek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mikronizeincekaplicek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand mikronizecek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='10.MİKRONİZE' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mikronizecek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mikronizecek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand mikronizekaplicek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='11.MİKRONİZE KAPLI' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        mikronizekaplicek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        mikronizekaplicek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand nanometrikcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='12.NANOMETRİK' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        nanometrikcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        nanometrikcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand nanometrikkaplicek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='13.NANOMETRİK KAPLI' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        nanometrikkaplicek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        nanometrikkaplicek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand hidrofilcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='15.HİDROFİL' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        hidrofilcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        hidrofilcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand hidrofilkaplicek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='16.HİDROFİL KAPLI' and  SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        hidrofilkaplicek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        hidrofilkaplicek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand talkcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='18.TALK' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        talkcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        talkcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand baritcek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='19.BARİT' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        baritcek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        baritcek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));
                        SqlCommand ticaricek = new SqlCommand("select ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as Ton from EditOrdersEnd where UrunAnaGrup='23.TİCARİ ÜRÜNLER' and SevkTarihi between @baslangictarihi and @bitistarihi and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        ticaricek.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(Session["urunbaslangic"]));
                        ticaricek.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(Session["urunbitis"]));


                        mozaik = Convert.ToInt32(mozaikcek.ExecuteScalar());
                        mozaikbeyaz = Convert.ToInt32(mozaikbeyazcek.ExecuteScalar());
                        granul = Convert.ToInt32(granulcek.ExecuteScalar());
                        granulkextra = Convert.ToInt32(granulextracek.ExecuteScalar());
                        mikronizekalin = Convert.ToInt32(mikronizekalincek.ExecuteScalar());
                        mikronizeince = Convert.ToInt32(mikronizeincecek.ExecuteScalar());
                        mikronizeincekapli = Convert.ToInt32(mikronizeincekaplicek.ExecuteScalar());
                        mikronize = Convert.ToInt32(mikronizecek.ExecuteScalar());
                        mikronizekapli = Convert.ToInt32(mikronizekaplicek.ExecuteScalar());
                        nanometrik = Convert.ToInt32(nanometrikcek.ExecuteScalar());
                        nanometrikkapli = Convert.ToInt32(nanometrikkaplicek.ExecuteScalar());
                        hidrofil = Convert.ToInt32(hidrofilcek.ExecuteScalar());
                        hidrofilkapli = Convert.ToInt32(hidrofilkaplicek.ExecuteScalar());
                        talk = Convert.ToInt32(talkcek.ExecuteScalar());
                        barit = Convert.ToInt32(baritcek.ExecuteScalar());
                        ticari = Convert.ToInt32(ticaricek.ExecuteScalar());
                        // con.Close();
                        
                        
            %>
            <div>
                <input id="myInput" type="text" class="form-control" placeholder="Aranacak Kelimeyi Yazınız" />
            </div>
            <br />
            <table class="table table-bordered" id="urunrapor">
                <thead>
                    <tr>
                        <td colspan="8" style="text-align: center; background-color: #008080; color: white;">URUN TOPLAM MARJ ICINDE</td>
                    </tr>
                    <tr>
                        <td style="text-align: center; background-color: #008080; color: white;">URUN ANA SINIFI</td>
                        <td style="text-align: center; background-color: #008080; color: white;">URUN</td>
                        <td style="text-align: center; background-color: #008080; color: white;">MUSTERI</td>
                        <td style="text-align: center; background-color: #008080; color: white;">TONAJ</td>
                        <td style="text-align: center; background-color: #008080; color: white;">MALIYET($)</td>
                        <td style="text-align: center; background-color: #008080; color: white;">CIRO($)</td>
                        <td style="text-align: center; background-color: #008080; color: white;">FARK($)</td>
                        <td style="text-align: center; background-color: #008080; color: white;">KAR(%)</td>
                    </tr>
                   
                </thead>
                 <tbody id="urun">
                <%
                        SqlCommand cmd = new SqlCommand("SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UrunAnaGrup,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as UrunAnaGrup,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Urun,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Urun,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(MusteriIsmi,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as MusteriIsmi,CAST(SUM(SHIPPEDAMOUNT/1000) as decimal(18,3)) as Ton,CAST(SUM((KalemMaliyeti)*SHIPPEDAMOUNT/1000) as decimal(18,3)) as Maliyet,CAST(SUM((KalemSatisFiyati)*SHIPPEDAMOUNT/1000) as decimal(18,3)) as Ciro,CAST(SUM((KalemSatisFiyati)*SHIPPEDAMOUNT/1000)-SUM((KalemMaliyeti)*SHIPPEDAMOUNT/1000) as decimal(18,3)) as Fark ,CAST((SUM((KalemSatisFiyati)*SHIPPEDAMOUNT/1000)-SUM((KalemMaliyeti)*SHIPPEDAMOUNT/1000))/SUM((KalemMaliyeti)*SHIPPEDAMOUNT/1000) as decimal(18,2)) as Kar from EditOrdersEnd where SevkTarihi between @baslangic and @bitis and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)  and MusteriKodu not in(select MusteriKodu from DepartmentCustomers) group by UrunAnaGrup,Urun,MusteriIsmi", con);
                        cmd.Parameters.AddWithValue("@baslangic", Convert.ToDateTime(Session["urunbaslangic"]));
                        cmd.Parameters.AddWithValue("@bitis", Convert.ToDateTime(Session["urunbitis"]));
                        SqlDataReader dr = cmd.ExecuteReader();
                       
                        while (dr.Read())
                        {%>
              
                   
                     <tr>
                    <td style="text-align: center; background-color: #008080; color: white;"><%=dr["UrunAnaGrup"].ToString() %></td>
                    <td><%=dr["Urun"].ToString() %></td>
                    <td><%=dr["MusteriIsmi"].ToString() %></td>
                    <td><%=dr["Ton"].ToString() %></td>
                    <td><%=dr["Maliyet"].ToString() %></td>
                    <td><%=dr["Ciro"].ToString() %></td>
                    <td><%=dr["Fark"].ToString() %></td>
                    <td><%=dr["Kar"].ToString() %></td>
                    </tr>
                 
                <%
                
                }
                 
                %>
                   <tr>
                        <td style="text-align: center;background-color: #008080; color:white;">GENEL TOPLAM</td>
                       <%
                        SqlCommand t = new SqlCommand("select CAST(ISNULL(SUM(SHIPPEDAMOUNT/1000),0) as decimal(18,3)) as Ton ,CAST(ISNULL(SUM(KalemMaliyeti*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3)) as Maliyet,CAST(ISNULL(SUM(KalemSatisFiyati*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3)) as Ciro,CAST(ISNULL(SUM(KalemSatisFiyati*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3))-CAST(ISNULL(SUM(KalemMaliyeti*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3)) as Fark,CAST((CAST(ISNULL(SUM(KalemSatisFiyati*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3))-CAST(ISNULL(SUM(KalemMaliyeti*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3)))/CAST(ISNULL(SUM(KalemMaliyeti*(SHIPPEDAMOUNT/1000)),0) as decimal(18,3)) as decimal(18,2)) as KarOrani from EditOrdersEnd where SevkTarihi between @baslangic and @bitis and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                        t.Parameters.AddWithValue("@baslangic", Convert.ToDateTime(Session["urunbaslangic"]));
                        t.Parameters.AddWithValue("@bitis", Convert.ToDateTime(Session["urunbitis"]));
                        SqlDataReader d = t.ExecuteReader();
                        while(d.Read())
                        {%>
                             <td style="text-align: center;">&nbsp</td>
                             <td style="text-align: center;">&nbsp</td>
                             <td style="text-align: center;"><%=d["Ton"].ToString() %></td>
                             <td style="text-align: center;"><%=d["Maliyet"].ToString() %></td>
                             <td style="text-align: center;"><%=d["Ciro"].ToString() %></td>
                             <td style="text-align: center;"><%=d["Fark"].ToString() %></td>
                             <td style="text-align: center;"><%=d["KarOrani"].ToString() %></td>
                        <%}
                        %>
                       
                    </tr>
               </tbody>
            </table>


            <%}

                }
                    
            %>
        </div>
        <!-- end row -->



        <!-- end row -->


        <%
            if (Session["urunbaslangic"] != null && Session["urunbitis"] != null)
            {%>
                
            <div class="col-xl-12">
            <div class="card-box">
                <div class="dropdown float-right">
                    <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
                        <i class="mdi mdi-dots-vertical"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">

                        <a href="UrunMusteriRaporlama.aspx" class="dropdown-item">Müşteriler</a>

                    </div>
                </div>

                <h4 class="header-title mt-0 mb-3">ÜRÜN ANA SINIF TONAJ</h4>

                <div id="container2">

                    <canvas id="barChart"></canvas>
                </div>
            </div>
        </div>
        
            <%}
            
         %>

        <!-- end col-->
        
        
    </div>
    <script src="/assets/libs/chart-js/Chart.bundle.min.js"></script>
    <script>
        var canvas = document.getElementById("barChart");
        var ctx = canvas.getContext('2d');

        // Global Options:
        Chart.defaults.global.defaultFontColor = 'dodgerblue';
        Chart.defaults.global.defaultFontSize = 16;


        // Data with datasets options
        var data = {
            labels: ["03.MOZAİK", "04.MOZAİK BEYAZ", "05.GRANÜL", "06.GRANÜL EXTRA", "07.MİKRONİZE KALIN", "08.MİKRONİZE İNCE", "09.MİKRONİZE İNCE KAPLI", "10.MİKRONİZE", "11.MİKRONİZE KAPLI", "12.NANOMETRİK", "13.NANOMETRİK KAPLI", "15.HİDROFİL", "16.HİDROFİL KAPLI", "18.TALK", "19.BARİT", "23.TİCARİ ÜRÜNLER"],
            datasets: [
              {
                  label: "ÜRÜN RAPORLAMA",
                  fill: true,
                  backgroundColor: [
                    '#00ffff',
                    '#0000ff',
                    '#7fff00',
                    '#dc143c',
                    '#b8860b',
                    '#006400',
                    '#8b0000',
                    '#ff1493',
                    '#ffd700',
                    '#808080',
                    '#7cfc00',
                    '#ba55d3',
                    '#808000',
                    '#ff4500',
                    '#fa8072',
                    '#a0522d',
                  ],
                  data: [<%=mozaik%>,<%=mozaikbeyaz%>,<%=granul%>,<%=granulkextra%>,<%=mikronizekalin%>,<%=mikronizeince%>,<%=mikronizeincekapli%>,<%=mikronize%>,<%=mikronizekapli%>,<%=nanometrik%>,<%=nanometrikkapli%>,<%=hidrofil%>,<%=hidrofilkapli%>,<%=talk%>,<%=barit%>,<%=ticari%>]
              }
            ]
        };

          // Notice how nested the beginAtZero is
          var options = {
              title: {
                  display: true,
                  text: 'ÜRÜN ANA SINIF TONAJ',
                  position: 'bottom'
              },
              scales: {
                  yAxes: [{
                      ticks: {
                          beginAtZero: true
                      }
                  }]
              }
          };

          // Chart declaration:
          var myBarChart = new Chart(ctx, {
              type: 'bar',
              data: data,
              options: options
          });
    </script>
    <!-- Init js -->







    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>



</asp:Content>
