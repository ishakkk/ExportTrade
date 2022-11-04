<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="KitaRaporlama.aspx.cs" Inherits="ExternalTrade.Admin.KitaRaporlama" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        function fnExcelReport() {
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange; var j = 0;
            tab = document.getElementById('kitalar'); // id of table

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
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#kita tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
    </script>
      <%
          int afrikaton, amerikaton, avrupaton, ortadoguton, asyaton, asyapasifikton;
          int afrikasatis, amerikasatis, avrupasatis, ortadogusatis, asyasatis, asyapasifiksatis;
        
          
          
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand afrikatoncek = new SqlCommand("select Ton from ContinentReport where Kita='Afrika'",con);
            SqlCommand avrupatoncek = new SqlCommand("select Ton from ContinentReport where Kita='Avrupa'", con);
            SqlCommand asyatoncek = new SqlCommand("select Ton from ContinentReport where Kita='Asya'", con);
            SqlCommand asyapasifiktoncek = new SqlCommand("select Ton from ContinentReport where Kita='Asya Pasifik'", con);
            SqlCommand amerikatoncek = new SqlCommand("select Ton from ContinentReport where Kita='Amerika'", con);
            SqlCommand ortadogutoncek = new SqlCommand("select Ton from ContinentReport where Kita='Orta Doğu'", con);

            SqlCommand afrikasatiscek = new SqlCommand("select Ciro from ContinentReport where Kita='Afrika'", con);
            SqlCommand avrupasatiscek = new SqlCommand("select Ciro from ContinentReport where Kita='Avrupa'", con);
            SqlCommand asyasatiscek = new SqlCommand("select Ciro from ContinentReport where Kita='Asya'", con);
            SqlCommand asyapasifiksatiscek = new SqlCommand("select Ciro from ContinentReport where Kita='Asya Pasifik'", con);
            SqlCommand amerikasatiscek = new SqlCommand("select Ciro from ContinentReport where Kita='Amerika'", con);
            SqlCommand ortadogusatiscek = new SqlCommand("select Ciro from ContinentReport where Kita='Orta Doğu'", con);

            afrikaton = Convert.ToInt32(afrikatoncek.ExecuteScalar());
            avrupaton = Convert.ToInt32(avrupatoncek.ExecuteScalar());
            asyaton = Convert.ToInt32(asyatoncek.ExecuteScalar());
            asyapasifikton = Convert.ToInt32(asyapasifiktoncek.ExecuteScalar());
            amerikaton = Convert.ToInt32(amerikatoncek.ExecuteScalar());
            ortadoguton = Convert.ToInt32(ortadogutoncek.ExecuteScalar());


            afrikasatis = Convert.ToInt32(afrikasatiscek.ExecuteScalar());
            avrupasatis = Convert.ToInt32(avrupasatiscek.ExecuteScalar());
            asyasatis = Convert.ToInt32(asyasatiscek.ExecuteScalar());
            asyapasifiksatis = Convert.ToInt32(asyapasifiksatiscek.ExecuteScalar());
            amerikasatis = Convert.ToInt32(amerikasatiscek.ExecuteScalar());
            ortadogusatis = Convert.ToInt32(ortadogusatiscek.ExecuteScalar());
            
            //con.Close();  
         
    %>
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
            }).then(function () { window.location = 'KitaRaporlama.aspx' });
        }
    </script>
    <script>
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Rapor Oluşturulamadı", type: "error"
            }).then(function () { window.location = 'KitaRaporlama.aspx' });
        }
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
                   <input type="button" value="EXCEL RAPORU AL" id="rapor" class="btn btn-primary" onclick="fnExcelReport()"  style="height:40px;" />
                </div>
            </div>
                <%
                    if( Session["kitabaslangic"]!="" &&  Session["kitabaslangic"]!=null)
                    {
                        if(Session["kitabitis"]!="" && Session["kitabitis"]!=null)
                        {%><br />
                <div>
                    <input type="text" id="myInput" class="form-control" placeholder="ARANACAK KELİMEYİ GİRİNİZ" />
                </div>
                            <div class="col-md-999" id="kayitlar" style="width: 1000px; overflow-x: scroll; overflow-y: scroll;">
                    <table class="table table-bordered" id="kitalar">
                        <thead>
                         <tr>
                            <th colspan="9" style="text-align: center;background-color:#008080;color:white;">SATIS DAGILIMI</th>

                        </tr>
                        <tr>
                            <th style="background-color:#008080;color:white;">KITALAR</th>
                            <th style="background-color:#008080;color:white;">TON</th>
                            <th style="background-color:#008080;color:white;">TON DAĞILIMI</th>
                            <th style="background-color:#008080;color:white;">CİRO($)</th>
                            <th style="background-color:#008080;color:white;">CİRO DAĞILIMI</th>
                            <th style="background-color:#008080;color:white;">MALİYET($)</th>
                            <th style="background-color:#008080;color:white;">FARK($)</th>
                            
                            <th style="background-color:#008080;color:white;">KAR ORANI(%)</th>
                        </tr>
                        </thead>
                    <tbody id="kita">
                               <tr>
                            <th style="background-color:#008080;color:white;">AMERİKA</th>
                            <%
                                SqlCommand cmd = new SqlCommand("select *from ContinentReport where Kita='Amerika'", con);
                                SqlDataReader dr = cmd.ExecuteReader();
                                while (dr.Read())
                                {%>
                                    <td><%=Convert.ToDouble(dr["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(dr["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(dr["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(dr["Fark"]) %></td>
                                   
                                    <td><%=Convert.ToDouble(dr["KarOrani"]) %></td>
                            <%}
                            %>
                        </tr>
                        <tr>
                            <th style="background-color:#008080;color:white;">AFRIKA</th>
                            <%
                                SqlCommand cmd2 = new SqlCommand("select *from ContinentReport where Kita='Afrika'", con);
                                SqlDataReader dr2 = cmd2.ExecuteReader();
                                while (dr2.Read())
                                {%>
                                    <td><%=Convert.ToDouble(dr2["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(dr2["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr2["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(dr2["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr2["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(dr2["Fark"]) %></td>
                                  
                                    <td><%=Convert.ToDouble(dr2["KarOrani"]) %></td>
                            <%}
                             
                            %>
                        </tr>
                        <tr>
                            <th style="background-color:#008080;color:white;">AVRUPA</th>
                            <%
                                SqlCommand cmd3 = new SqlCommand("select *from ContinentReport where Kita='Avrupa'", con);
                                SqlDataReader dr3 = cmd3.ExecuteReader();
                                while(dr3.Read())
                                {%>
                                    <td><%=Convert.ToDouble(dr3["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(dr3["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr3["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(dr3["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr3["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(dr3["Fark"]) %></td>
                                    
                                    <td><%=Convert.ToDouble(dr3["KarOrani"]) %></td>
                                <%}
                             %>
                          
                        </tr>
                        <tr>
                            <th style="background-color:#008080;color:white;">ORTA DOGU</th>
                            <%
                                SqlCommand cmd4 = new SqlCommand("select *from ContinentReport where Kita='Orta Doğu'", con);
                                SqlDataReader dr4 = cmd4.ExecuteReader();
                                while (dr4.Read())
                                {%>
                                    <td><%=Convert.ToDouble(dr4["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(dr4["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr4["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(dr4["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr4["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(dr4["Fark"]) %></td>
                                  
                                    <td><%=Convert.ToDouble(dr4["KarOrani"]) %></td>
                                <%}
                             %>
                            
                           
                        </tr>
                        <tr>
                            <th style="background-color:#008080;color:white;">ASYA</th>
                            <%
                                SqlCommand cmd5 = new SqlCommand("select *from ContinentReport where Kita='Asya'", con);
                                SqlDataReader dr5 = cmd5.ExecuteReader();
                                while (dr5.Read())
                                {%>
                                    <td><%=Convert.ToDouble(dr5["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(dr5["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr5["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(dr5["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr5["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(dr5["Fark"]) %></td>
                                   
                                    <td><%=Convert.ToDouble(dr5["KarOrani"]) %></td>
                                <%}
                             %>
                        
                        </tr>
                              <tr>
                            <th style="background-color:#008080;color:white;">ASYA PASIFIK</th>
                            <%
                                SqlCommand cmd6 = new SqlCommand("select *from ContinentReport where Kita='Asya Pasifik'", con);
                                SqlDataReader dr6 = cmd6.ExecuteReader();
                                while (dr6.Read())
                                {%>
                                    <td><%=Convert.ToDouble(dr6["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(dr6["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr6["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(dr6["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(dr6["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(dr6["Fark"]) %></td>
                                    
                                    <td><%=Convert.ToDouble(dr6["KarOrani"]) %></td>
                                <%}
                             %>
                        
                        </tr>
                        <tr>
                            <th style="background-color:#008080;color:white;">GENEL TOPLAM</th>
                            <%
                                SqlCommand total = new SqlCommand("select SUM(Ton) as Ton ,SUM(TonDagilimi) as TonDagilimi ,SUM(Ciro) as Ciro,SUM(CiroDagilimi) as CiroDagilimi,SUM(Maliyet) as Maliyet,SUM(Fark) as Fark,SUM(UrunSadeMaliyeti) as UrunSadeMaliyeti,CAST(SUM(Fark)/SUM(Maliyet) as decimal(18,3)) as KarOrani from ContinentReport", con);
                                SqlDataReader totaloku = total.ExecuteReader();
                                while(totaloku.Read())
                                {%>
                                    <td><%=Convert.ToDouble(totaloku["Ton"]) %></td>
                                    <td><%=Convert.ToDouble(totaloku["TonDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(totaloku["Ciro"]) %></td>
                                    <td><%=Convert.ToDouble(totaloku["CiroDagilimi"]) %></td>
                                    <td><%=Convert.ToDouble(totaloku["Maliyet"]) %></td>
                                    <td><%=Convert.ToDouble(totaloku["Fark"]) %></td>
                                   
                                    <td><%=Convert.ToDouble(totaloku["KarOrani"]) %></td>
                                <%}
                                 %>
                           
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
        if (Session["kitabaslangic"] != null && Session["kitabitis"] != null)
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

                        <a href="KitaMusteriRaporlama.aspx" class="dropdown-item">Müşteriler</a>

                    </div>
                </div>

                <h4 class="header-title mt-0 mb-3">TON</h4>

                <div id="container">
                   
                <canvas id="myChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-xl-8">
            <div class="card-box">
                <div class="dropdown float-right">
                    <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
                        <i class="mdi mdi-dots-vertical"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">

                        <a href="KitaMusteriRaporlama.aspx" class="dropdown-item">Müşteriler</a>

                    </div>
                </div>

                <h4 class="header-title mt-0 mb-3"> SATIŞ</h4>

                <div id="container2">
                   
                <canvas id="myChart2"></canvas>
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



    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>
       <script>
           var ctx = document.getElementById('myChart').getContext('2d');
           var myChart = new Chart(ctx, {
               type: 'pie',
               data: {
                   labels: ["AMERİKA TON", "AFRİKA TON", "AVRUPA TON", "ORTA DOĞU TON", "ASYA TON", "ASYA PASİFİK TON"],
                   datasets: [{
                       data: [<%=amerikaton%>, <%=afrikaton%>, <%=avrupaton%>, <%=ortadoguton%>, <%=asyaton%>, <%=asyapasifikton%>],

                       backgroundColor: [
                         "rgb(127,255,0)",
                          "rgb(0,0,139)",
                          "rgb(0,139,139)",
                           "rgb(0,255,127)",
                          "rgb(255,0,0)",
                          "rgb(154,205,50)"


                       ],
                       borderWidth: 2,
                   }]
               },
               options: {
                   scales: {
                       xAxes: [{
                           display: false,
                       }],
                       yAxes: [{
                           display: false,
                       }],
                   }
               },
           });

    </script>
    <script>
        var ctx = document.getElementById('myChart2').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ["AMERİKA SATIŞ", "AFRİKA SATIŞ", "AVRUPA SATIŞ", "ORTA DOĞU SATIŞ", "ASYA SATIŞ", "ASYA PASİFİK SATIŞ"],
                datasets: [{


                    data: [<%=amerikasatis%>, <%=afrikasatis%>, <%=avrupasatis%>, <%=ortadogusatis%>, <%=asyasatis%>, <%=asyapasifiksatis%>],




                    backgroundColor: [
                      "rgb(127,255,0)",
                        "rgb(0,0,139)",
                        "rgb(0,139,139)",
                         "rgb(0,255,127)",
                        "rgb(255,0,0)",
                        "rgb(154,205,50)"


                    ],
                    borderWidth: 2,
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        display: false,
                    }],
                    yAxes: [{
                        display: false,
                    }],
                }
            },
        });

    </script>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [ContinentReport] WHERE ([Kıta] = @Kıta)" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="Kıta" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
