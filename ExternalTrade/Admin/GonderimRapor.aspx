<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GonderimRapor.aspx.cs" Inherits="ExternalTrade.Admin.GonderimRapor" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        function fnExcelReport() {
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange; var j = 0;
            tab = document.getElementById('gonderimrapor'); // id of table

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
                $("#gonderim tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
   
    <%
        int exwton, faston, fcaton, fobton, cfrton, cifton, dapton, datton,ihrackayitton;
        int exwsatis, fassatis, fcasatis, fobsatis, cfrsatis, cifsatis, dapsatis, datsatis,ihrackayitsatis;

        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        SqlCommand exwtoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=1", con);
        SqlCommand fastoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=2", con);
        SqlCommand fcatoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=3", con);
        SqlCommand fobtoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=4", con);
        SqlCommand cfrtoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=5", con);
        SqlCommand ciftoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=6", con);
        SqlCommand daptoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=7", con);
        SqlCommand dattoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=8", con);
        SqlCommand ihrackayittoncek = new SqlCommand("select ISNULL(SUM(Ton),0) from SendTypeReport where Id=11",con);

        SqlCommand exwsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=1", con);
        SqlCommand fassatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=2", con);
        SqlCommand fcasatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=3", con);
        SqlCommand fobsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=4", con);
        SqlCommand cfrsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=5", con);
        SqlCommand cifsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=6", con);
        SqlCommand dapsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=7", con);
        SqlCommand datsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=8", con);
        SqlCommand ihrackayitsatiscek = new SqlCommand("select ISNULL(SUM(Ciro),0) from SendTypeReport where Id=11", con);
       
        exwton = Convert.ToInt32(exwtoncek.ExecuteScalar());
        faston = Convert.ToInt32(fastoncek.ExecuteScalar());
        fcaton = Convert.ToInt32(fcatoncek.ExecuteScalar());
        fobton = Convert.ToInt32(fobtoncek.ExecuteScalar());
        cfrton = Convert.ToInt32(cfrtoncek.ExecuteScalar());
        cifton = Convert.ToInt32(ciftoncek.ExecuteScalar());
        dapton = Convert.ToInt32(daptoncek.ExecuteScalar());
        datton = Convert.ToInt32(dattoncek.ExecuteScalar());
        ihrackayitton = Convert.ToInt32(ihrackayittoncek.ExecuteScalar());



        exwsatis = Convert.ToInt32(exwsatiscek.ExecuteScalar());
        fassatis = Convert.ToInt32(fassatiscek.ExecuteScalar());
        fcasatis = Convert.ToInt32(fcasatiscek.ExecuteScalar());
        fobsatis = Convert.ToInt32(fobsatiscek.ExecuteScalar());
        cfrsatis = Convert.ToInt32(cfrsatiscek.ExecuteScalar());
        cifsatis = Convert.ToInt32(cifsatiscek.ExecuteScalar());
        dapsatis = Convert.ToInt32(dapsatiscek.ExecuteScalar());
        datsatis = Convert.ToInt32(datsatiscek.ExecuteScalar());
        ihrackayitsatis = Convert.ToInt32(ihrackayitsatiscek.ExecuteScalar());
        //con.Close();
    %>
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
            }).then(function () { window.location = 'GonderimRapor.aspx' });
        }
    </script>
    <script>
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Rapor Oluşturulamadı", type: "error"
            }).then(function () { window.location = 'GonderimRapor.aspx' });
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
                <div>
                    <asp:Button ID="btnCek" runat="server" Text="Raporla" CssClass="btn btn-success" OnClick="btnCek_Click" Height="40px" />
                    <div style="float: right">
                        <%--<asp:Button ID="btn" runat="server" Text="Excel Raporu Al" CssClass="btn btn-primary"  Height="40px"/>--%>
                        <input type="button" id="excel" value="Excel Raporu Al" class="btn btn-primary" style="height: 40px;" onclick="fnExcelReport()" />
                    </div>
                </div>



                <br />
                <%
                    if( Session["gonderimbaslangic"]!=null &&  Session["gonderimbaslangic"]!="")
                    {
                        if( Session["gonderimbitis"]!=null &&  Session["gonderimbitis"]!="")
                        {%>
                <div>
                    <input id="myInput" class="form-control" type="text" placeholder="ARANACAK KELİMEYİ GİRİNİZ" />
                </div>
                            <table class="table table-bordered" id="gonderimrapor">
                    <thead>
                        <tr>
                        <th style="background-color:#008080;color:white;">GÖNDERİM TİPİ</th>
                        <th style="background-color:#008080;color:white;">TON</th>
                        <th style="background-color:#008080;color:white;">TON DAĞILIMI</th>
                        <th style="background-color:#008080;color:white;">CİRO($)</th>
                        <th style="background-color:#008080;color:white;">CİRO DAĞILIMI</th>
                        <th style="background-color:#008080;color:white;">MALİYET($)</th>
                      
                        <th style="background-color:#008080;color:white;">FARK($)</th>
                        <th style="background-color:#008080;color:white;">KAR ORANI(%)</th>
                    </tr>
                    </thead>
                      <tbody id="gonderim">
                               <tr>
                        <td style="background-color:#008080;color:white;">EXW</td>
                        <%
                            SqlCommand cmd = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=1", con);
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
                            dr.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">FAS</th>
                         <%
                             SqlCommand cmd2 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=2", con);
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
                            dr2.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">FCA</th>
                        <%
                            SqlCommand cmd3 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=3", con);
                            SqlDataReader dr3 = cmd3.ExecuteReader();
                            while (dr3.Read())
                            {%>
                                 <td><%=Convert.ToDouble(dr3["Ton"]) %></td>
                                 <td><%=Convert.ToDouble(dr3["TonDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr3["Ciro"]) %></td>
                                 <td><%=Convert.ToDouble(dr3["CiroDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr3["Maliyet"]) %></td>
                                 <td><%=Convert.ToDouble(dr3["Fark"]) %></td>
                               
                                 <td><%=Convert.ToDouble(dr3["KarOrani"]) %></td>
                                
                        <%}
                            dr3.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">FOB</th>
                         <%
                             SqlCommand cmd4 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=4", con);
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
                            dr4.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">CFR</th>
                         <%
                             SqlCommand cmd5 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=5", con);
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
                            dr5.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">CIF</th>
                          <%
                              SqlCommand cmd6 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=6", con);
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
                            dr6.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">DAP</th>
                         <%
                             SqlCommand cmd7 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=7", con);
                            SqlDataReader dr7 = cmd7.ExecuteReader();
                            while (dr7.Read())
                            {%>
                                 <td><%=Convert.ToDouble(dr7["Ton"]) %></td>
                                 <td><%=Convert.ToDouble(dr7["TonDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr7["Ciro"]) %></td>
                                 <td><%=Convert.ToDouble(dr7["CiroDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr7["Maliyet"]) %></td>
                                 <td><%=Convert.ToDouble(dr7["Fark"]) %></td>
                                
                                 <td><%=Convert.ToDouble(dr7["KarOrani"]) %></td>   
                        <%}
                            dr7.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">DAT</th>
                          <%
                              SqlCommand cmd8 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=8", con);
                            SqlDataReader dr8 = cmd8.ExecuteReader();
                            while (dr8.Read())
                            {%>
                                 <td><%=Convert.ToDouble(dr8["Ton"]) %></td>
                                 <td><%=Convert.ToDouble(dr8["TonDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr8["Ciro"]) %></td>
                                 <td><%=Convert.ToDouble(dr8["CiroDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr8["Maliyet"]) %></td>
                                 <td><%=Convert.ToDouble(dr8["Fark"]) %></td>
                              
                                 <td><%=Convert.ToDouble(dr8["KarOrani"]) %></td>
                                
                        <%}
                            dr8.Close();
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">İHRAÇ KAYITLI</th>
                        <%
                            SqlCommand cmd9 = new SqlCommand("select ISNULL(Ton,0) as Ton,ISNULL(TonDagilimi,0) as TonDagilimi,ISNULL(Ciro,0) as Ciro,ISNULL(CiroDagilimi,0) as CiroDagilimi,ISNULL(Maliyet,0) as Maliyet,ISNULL(Fark,0) as Fark,ISNULL(UrunSadeMaliyeti,0) as UrunSadeMaliyeti,ISNULL(KarOrani,0) as KarOrani from SendTypeReport where Id=11", con);
                            SqlDataReader dr9 = cmd9.ExecuteReader();
                            while(dr9.Read())
                            {%>
                                 <td><%=Convert.ToDouble(dr9["Ton"]) %></td>
                                 <td><%=Convert.ToDouble(dr9["TonDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr9["Ciro"]) %></td>
                                 <td><%=Convert.ToDouble(dr9["CiroDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(dr9["Maliyet"]) %></td>
                                 <td><%=Convert.ToDouble(dr9["Fark"]) %></td>
                                
                                 <td><%=Convert.ToDouble(dr9["KarOrani"]) %></td>
                            <%}
                        %>
                    </tr>
                    <tr>
                        <th style="background-color:#008080;color:white;">GENEL TOPLAM</th>
                        <%
                            SqlCommand t = new SqlCommand("select SUM(Ton) as Ton,SUM(TonDagilimi) as TonDagilimi,SUM(Ciro) as Ciro,SUM(CiroDagilimi) as CiroDagilimi,SUM(Maliyet) as Maliyet,SUM(Fark) as Fark,SUM(UrunSadeMaliyeti) as UrunSadeMaliyeti,CAST(SUM(Fark)/SUM(Maliyet) as decimal(18,3)) as KarOrani from SendTypeReport", con);
                            SqlDataReader d = t.ExecuteReader();
                            while(d.Read())
                            {%>
                                <td><%=Convert.ToDouble(d["Ton"]) %></td>
                                 <td><%=Convert.ToDouble(d["TonDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(d["Ciro"]) %></td>
                                 <td><%=Convert.ToDouble(d["CiroDagilimi"]) %></td>
                                 <td><%=Convert.ToDouble(d["Maliyet"]) %></td>
                                 <td><%=Convert.ToDouble(d["Fark"]) %></td>
                                 
                                 <td><%=Convert.ToDouble(d["KarOrani"]) %></td>
                            <%}
                                d.Close();
                        %>
                    </tr>
                      </tbody>
               
                </table>
                        <%}
                    }
                    
                 %>
                

            </div>
        </div>
    </div>
    <%
        if (Session["gonderimbaslangic"] != null && Session["gonderimbitis"] != null)
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

                        <a href="GonderimMusteriRapor.aspx" class="dropdown-item">Müşteriler</a>

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

                        <a href="GonderimMusteriRapor.aspx?x=<%=Request.QueryString["x"] %>" class="dropdown-item">Müşteriler</a>

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


    <script src="/assets/libs/chart-js/Chart.bundle.min.js"></script>

    <!-- Init js -->
     <script>
         var ctx = document.getElementById('myChart').getContext('2d');
         var myChart = new Chart(ctx, {
             type: 'pie',
             data: {
                 labels: ["EWX TON", "FAS TON", "FCA TON", "FOB TON", "CFR TON", "CIF TON", "DAP TON", "DAT TON", "İHRAC KAYIT TON"],
                 datasets: [{
                     data: [<%=exwton%>,<%=faston%>,<%=fcaton%>,<%=fobton%>,<%=cfrton%>,<%=cifton%>,<%=dapton%>,<%=datton%>,<%=ihrackayitton%>],

                     backgroundColor: [
                       "rgb(255,215,0)",
                        "rgb(154,205,50)",
                        "rgb(128,128,0)",
                         "rgb(72,61,139)",
                        "rgb(173,255,47)",
                        "rgb(135,206,250)",
                         "rgb(50,205,50)",
                        "rgb(25,25,112)",
                        "rgb(255,0,255)",

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
                labels: ["EWX SATIŞ", "FAS SATIŞ", "FCA SATIŞ", "FOB SATIŞ", "CFR SATIŞ", "CIF SATIŞ", "DAP SATIŞ", "DAT SATIŞ", "İHRAÇ KAYIT SATIŞ"],
                datasets: [{


                    data: [<%=exwsatis%>,<%=fassatis%>,<%=fcasatis%>,<%=fobsatis%>,<%=cfrsatis%>,<%=cifsatis%>,<%=dapsatis%>,<%=datsatis%>,<%=ihrackayitsatis%>],




                    backgroundColor: [
                      "rgb(255,215,0)",
                        "rgb(154,205,50)",
                        "rgb(128,128,0)",
                         "rgb(72,61,139)",
                        "rgb(173,255,47)",
                        "rgb(135,206,250)",
                         "rgb(50,205,50)",
                        "rgb(25,25,112)",
                        "rgb(255,0,255)",
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
    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>


</asp:Content>

