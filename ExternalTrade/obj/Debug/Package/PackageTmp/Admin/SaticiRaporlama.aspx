<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SaticiRaporlama.aspx.cs" Inherits="ExternalTrade.Admin.SaticiRaporlama" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <script>
        function fnExcelReport() {
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange; var j = 0;
            tab = document.getElementById('rapor'); // id of table

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
       
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        int[] tonaj = new int[6];
        int[] satis = new int[6];
    %>
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
            }).then(function () { window.location = 'SaticiRaporlama.aspx' });
        }
    </script>
    <script>
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Rapor Oluşturulamadı", type: "error"
            }).then(function () { window.location = 'SaticiRaporlama.aspx' });
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLocaleLowerCase();
                $("#satici tr").filter(function () {
                    $(this).toggle($(this).text().toLocaleLowerCase().indexOf(value) > -1);

                });
            });

        });
    </script>
    <div class="row">
        <div class="col-xl-12">
            <div class="card-box">
                <div>
                    BAŞLANGIÇ TARİHİ
                </div>
                <div>
                    <asp:TextBox ID="txttar1" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                </div>
                <div>
                    BİTİŞ TARİHİ
                </div>
                <div>
                    <asp:TextBox ID="txttar2" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                </div>
                <br />



                <div>
                    <asp:Button ID="btnCek" runat="server" Text="Raporla" CssClass="btn btn-success" OnClick="btnCek_Click" Height="40px" />
                    <div style="float: right">
                        <input type="button" value="EXCEL RAPORU AL" class="btn btn-primary" style="height: 40px;" onclick="fnExcelReport()" />
                    </div>

                </div>
                <%
                    if (Session["saticibaslangic"] != null && Session["saticibaslangic"] != "")
                    {
                        if (Session["saticibitis"] != null && Session["saticibitis"] != "")
                        {%>
                <br />
                <div>
                    <input type="text" placeholder="ARANACAK KELİMEYİ GİRİNİZ" id="myInput" class="form-control"/>
                </div>
                <br />
                <div class="col-md-999" id="kayitlar" style="width: 1000px; overflow-x: scroll; overflow-y: scroll;">
                    <table class="table table-bordered" id="rapor">
                        <thead>
                            <tr>
                                <th style="background-color: #008080; color: white;">TEMSİLCİ</th>
                                <th style="background-color: #008080; color: white;">TON</th>
                                <th style="background-color: #008080; color: white;">TON DAĞILIMI</th>
                                <th style="background-color: #008080; color: white;">CİRO($)</th>
                                <th style="background-color: #008080; color: white;">CİRO DAĞILIMI</th>
                                <th style="background-color: #008080; color: white;">MALİYET($)</th>
                                <th style="background-color: #008080; color: white;">FARK($)</th>
                               
                                <th style="background-color: #008080; color: white;">KAR ORANI(%)</th>
                            </tr>

                        </thead>
                        <tbody id="satici">
                           <%
                            int sayac = 0;
                            SqlCommand idcek = new SqlCommand("select Id,Name+' '+SurName as AdSoyad from Users where Authority='User' or Authority='Admin'", con);
                            SqlDataReader idoku = idcek.ExecuteReader();
                            while(idoku.Read())
                            {%>
                                <tr>
                                     <th style="background-color: #008080; color: white;"><%=idoku["AdSoyad"].ToString() %></th>
                           
                                    <%
                                  SqlCommand cmd = new SqlCommand("select u.Name+' '+u.SurName as Temsilci,s.Ton,s.TonDagilimi,s.Ciro,s.CiroDagilimi,s.Maliyet,s.Fark,s.KarOrani  from SalesReport s left outer join Users u on s.Temsilci=u.Id where u.Id='"+Convert.ToInt32(idoku["Id"])+"'", con);
                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                tonaj[sayac] = Convert.ToInt32(dr["Ton"]);
                                satis[sayac] = Convert.ToInt32(dr["Ciro"]);
                                %>
                                <td><%=Convert.ToDouble(dr["Ton"]) %></td>
                                <td><%=Convert.ToDouble(dr["TonDagilimi"]) %></td>
                                <td><%=Convert.ToDouble(dr["Ciro"]) %></td>
                                <td><%=Convert.ToDouble(dr["CiroDagilimi"]) %></td>
                                <td><%=Convert.ToDouble(dr["Maliyet"]) %></td>
                                <td><%=Convert.ToDouble(dr["Fark"]) %></td>
                                <td><%=Convert.ToDouble(dr["KarOrani"]) %></td>
                                <%
                                sayac++;
                                }
                                
                               %>
                                         </tr>
                            <%}
                               
                            %>
                
                         <%--   <tr>
                                <th style="background-color: #008080; color: white;">DEPARTMAN SATIŞI</th>
                                <%
                            SqlCommand dep = new SqlCommand("select SUM(Ton) as Ton,SUM(TonDagilimi) as TonDagilimi, SUM(Ciro) as Ciro , SUM(CiroDagilimi) as CiroDagilimi,SUM(Maliyet) as Maliyet,SUM(Fark) as Fark,SUM(Kar) as KarOrani from Department_Report", con);
                                SqlDataReader de = dep.ExecuteReader();
                                while (de.Read())
                                {
                                    tonaj[5] = Convert.ToInt32(de["Ton"]);
                                    satis[5] = Convert.ToInt32(de["Ciro"]);
                                %>
                                <td><%=Convert.ToDouble(de["Ton"]) %></td>
                                <td><%=Convert.ToDouble(de["TonDagilimi"]) %></td>
                                <td><%=Convert.ToDouble(de["Ciro"]) %></td>
                                <td><%=Convert.ToDouble(de["CiroDagilimi"]) %></td>
                                <td><%=Convert.ToDouble(de["Maliyet"]) %></td>
                                <td><%=Convert.ToDouble(de["Fark"]) %></td>
                               
                                <td><%=Convert.ToDouble(de["KarOrani"]) %></td>
                                <%}
                            
                            
                                %>
                            </tr>--%>
                            <tr>
                                <%
                                double[] satici = new double[8];
                                double[] departman = new double[8];
                                SqlCommand sa = new SqlCommand("select SUM(Ton) as Ton,SUM(TonDagilimi) as TonDagilimi, SUM(Ciro) as Ciro , SUM(CiroDagilimi) as CiroDagilimi,SUM(Maliyet) as Maliyet,SUM(Fark) as Fark,SUM(UrunSadeMaliyeti) as UrunSadeMaliyeti,SUM(KarOrani) as KarOrani from SalesReport", con);
                                SqlDataReader sr = sa.ExecuteReader();
                                while (sr.Read())
                                {
                                    satici[0] = Convert.ToDouble(sr["Ton"]);
                                    satici[1] = Convert.ToDouble(sr["TonDagilimi"]);
                                    satici[2] = Convert.ToDouble(sr["Ciro"]);
                                    satici[3] = Convert.ToDouble(sr["CiroDagilimi"]);
                                    satici[4] = Convert.ToDouble(sr["Maliyet"]);
                                    satici[5] = Convert.ToDouble(sr["Fark"]);
                                   
                                    satici[7] = Convert.ToDouble(sr["KarOrani"]);
                                }
                              
                            
                                %>
                                <th style="background-color: #008080; color: white;">TOPLAM</th>
                                <td><%=satici[0] %></td>
                                <td><%=satici[1] %></td>
                                <td><%=satici[2] %></td>
                                <td><%=satici[3] %></td>
                                <td><%=satici[4] %></td>
                                <td><%=satici[5] %></td>
                                 <td><%=Math.Round((satici[5])/(satici[4]),2) %></td>
                               

                            </tr>
                        </tbody>


                    </table>
                </div>
                <%}
                    } 
                %>
            </div>


        </div>
    </div>
    <%
        if (Session["saticibaslangic"] != null && Session["saticibitis"] != null)
        {%>
            <div class="row">


        <!-- end col-->
        <div class="col-xl-8">
            <div class="card-box">
                <div class="dropdown float-right">
                    <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
                        <i class="mdi mdi-dots-vertical"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">

                        <a href="SaticiMusteriRaporlama.aspx" class="dropdown-item">Müşteriler</a>

                    </div>
                </div>



                <div id="container">
                    <canvas id="barChart"></canvas>
                </div>
            </div>
        </div>


        <!-- end col-->

    </div>
    <div class="row">


        <!-- end col-->
        <div class="col-xl-8">
            <div class="card-box">
                <div class="dropdown float-right">
                    <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
                        <i class="mdi mdi-dots-vertical"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">

                        <a href="SaticiMusteriRaporlama.aspx" class="dropdown-item">Müşteriler</a>

                    </div>
                </div>



                <div id="container2">
                    <canvas id="barChart2"></canvas>
                </div>
            </div>
        </div>


        <!-- end col-->

    </div>

       <%}
    %>
    

    
    <!-- end row -->



    <!-- end row -->


    <script src="/assets/libs/chart-js/Chart.bundle.min.js"></script>

    <!-- Init js -->
    <script>
        var canvas = document.getElementById("barChart");
        var ctx = canvas.getContext('2d');

        // Global Options:
        Chart.defaults.global.defaultFontColor = 'dodgerblue';
        Chart.defaults.global.defaultFontSize = 16;


        // Data with datasets options
        var data = {

            labels: ["Mehmet ÖNCAN", "Mehmet NİŞAN", "Ömer ELGİN", "Mevlüt ŞAHİN", "Erdinç KESKİN", "Departman Satışı"],
            datasets: [
              {
                  label: "SATICI RAPORLAMA",
                  fill: true,
                  backgroundColor: [
                      '#00ffff',
                      '#8a2be2',
                      '#7fff00',
                      '#dc143c',
                      '#b8860b',
                      '#9400d3',
                  ],
                  data: [<%=tonaj[0]%>, <%=tonaj[1]%>, <%=tonaj[2]%>, <%=tonaj[3]%>, <%=tonaj[4]%>, <%=tonaj[5]%>]
              }
            ]
        };

          // Notice how nested the beginAtZero is
          var options = {
              title: {
                  display: true,
                  text: 'SATICI TONAJ',
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
    <script>
        var canvas = document.getElementById("barChart2");
        var ctx = canvas.getContext('2d');

        // Global Options:
        Chart.defaults.global.defaultFontColor = 'dodgerblue';
        Chart.defaults.global.defaultFontSize = 16;


        // Data with datasets options
        var data = {
            labels: ["Mehmet ÖNCAN", "Mehmet NİŞAN", "Ömer ELGİN", "Mevlüt ŞAHİN", "Erdinç KESKİN", "Departman Satışı"],
            datasets: [
              {
                  label: "SATICI RAPORLAMA",
                  fill: true,
                  backgroundColor: [
                      '#00ffff',
                      '#8a2be2',
                      '#7fff00',
                      '#dc143c',
                      '#b8860b',
                      '#9400d3',
                  ],
                  data: [<%=satis[0]%>, <%=satis[1]%>, <%=satis[2]%>, <%=satis[3]%>, <%=satis[4]%>, <%=satis[5]%>]
              }
            ]
        };

          // Notice how nested the beginAtZero is
          var options = {
              title: {
                  display: true,
                  text: 'SATICI CİRO ($)',
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
    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>
    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>

    <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select u.Name+' '+u.SurName as Temsilci,s.Ton,s.TonDagilimi,s.Satis,s.Maliyet,s.Fark  from SalesReport s left outer join Users u on s.Temsilci=u.Id WHERE ([Temsilci] = @Temsilci)" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="Temsilci" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>

