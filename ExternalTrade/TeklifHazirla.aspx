<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TeklifHazirla.aspx.cs" Inherits="ExternalTrade.TeklifHazirla" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .GridTemplate * {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif !important;
            font-size: 12px !important;
        }
    </style>
    <script src="jquery-3.6.0.min.js"></script>
    <%
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        int sayi = 0;
    %>
    <script type="text/javascript">
        $(document).ready(function () {

            var continentsDDL = $("#continents");
            var countriesDDL = $("#countries");
            var portsDDL = $("#ports");
            var urunanasinifDDL = $("#urunanasinif");
            var urundetayDDL = $("#urundetay");
            var urundetayDDLiki = $("#urundetay2");
         <%
        using (SqlConnection con = new SqlConnection(strcon))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select COUNT(*) from Sepet where TeklifNo='" + txtTeklifNo.Text + "'", con);
            sayi = Convert.ToInt32(cmd.ExecuteScalar());

            if (sayi == 0)
            {%>
            $.ajax({

                url: "AJAX.asmx/GetContinents",
                method: "post",
                dataType: "json",
                success: function (data) {
                    continentsDDL.append($('<option/>', { value: -1, text: 'Bölge Seçiniz' }));
                    countriesDDL.append($('<option/>', { value: -1, text: 'Ülke Seçiniz' }));
                    portsDDL.append($('<option/>', { value: -1, text: 'Liman Seçiniz' }));
                    $(data).each(function (index, item) {
                        continentsDDL.append($('<option/>', { value: item.Id, text: item.ContinetName }));
                    });
                }
            });

            continentsDDL.change(function () {
                if ($(this).val() == "-1") {
                    countriesDDL.empty();
                    countriesDDL.append("<option/>", { value: -1, text: 'Ülke Seçiniz' });
                    countriesDDL.val('-1');

                }
                else {
                    $.ajax({
                        url: "AJAX.asmx/GetConuntryById",
                        data: { UstId: $(this).val() },
                        method: "post",
                        dataType: "json",
                        success: function (data) {
                            countriesDDL.empty();

                            countriesDDL.append($('<option/>', { value: -1, text: 'Ülke Seçiniz' }));
                            portsDDL.append($('<option/>', { value: -1, text: 'Liman Seçiniz' }));
                            $(data).each(function (index, item) {
                                countriesDDL.append($('<option/>', { value: item.Id, text: item.CountryName }));
                            });
                        }
                    });
                }
            });

            countriesDDL.change(function () {
                if ($(this).val() == "-1") {
                    portsDDL.empty();
                    portsDDL.append("<option/>", { value: -1, text: 'Liman Seçiniz' });
                    portsDDL.val('-1');

                }
                else {
                    $.ajax({
                        url: "AJAX.asmx/GetPortsById",
                        data: { UlkeId: $(this).val() },
                        method: "post",
                        dataType: "json",
                        success: function (data) {
                            portsDDL.empty();
                            portsDDL.append($('<option/>', { value: -1, text: 'Liman Seçiniz' }));

                            $(data).each(function (index, item) {
                                portsDDL.append($('<option/>', { value: item.Id, text: item.PortName }));
                            });
                        }
                    });
                }
            });

             <%}
            else
            {
                SqlCommand bül = new SqlCommand("select s.Kita,c.Id as KitaId,s.Ulke,coun.Id as UlkeId,s.VarisLimani,o.Id as LimanId,Convert(nchar(10),s.TTarih) as TTarih from Sepet s left outer join Continent c on s.Kita=c.ContinentName left outer join Country coun on s.Ulke=coun.CountryName left outer join OtherPorts o on s.VarisLimani=o.PortName where s.TeklifNo='" + txtTeklifNo.Text + "'    group by  s.Kita,c.Id ,s.Ulke,coun.Id ,s.VarisLimani,o.Id ,s.TTarih", con);
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = bül;
                DataTable dt = new DataTable();
                adp.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {%>
            continentsDDL.append($('<option/>', { value: '<%=dr["KitaId"].ToString() %>', text: '<%=dr["Kita"].ToString() %>' }));
            countriesDDL.append($('<option/>', { value: '<%=dr["UlkeId"].ToString() %>', text: '<%=dr["Ulke"].ToString() %>' }));
            portsDDL.append($('<option/>', { value: '<%=dr["LimanId"].ToString() %>', text: '<%=dr["VarisLimani"].ToString() %>' }));
                      
                 <%
                     txtvarislimani.Text = dr["VarisLimani"].ToString();
                     txtvarislimani.Enabled = false;
                     txtManueltarih.TextMode = TextBoxMode.SingleLine;
                     txtManueltarih.Text = dr["TTarih"].ToString();
                     //txtManueltarih.Text = DateTime.Now.ToString("yyyy-mm-dd");
                     txtManueltarih.Enabled = false;
                 }
             }
            SqlConnection.ClearPool(con);
            con.Close();
        }
         
         
          %>



            $.ajax({
                //url: "http://trade.nigtas.com/AJAX.asmx/GetContinents",
                url: "AJAX.asmx/GetProduct",
                method: "post",
                dataType: "json",
                success: function (data) {
                    urunanasinifDDL.append($('<option/>', { value: -1, text: 'ÜRÜN ÜST SINIF' }));
                    urundetayDDL.append($('<option/>', { value: -1, text: 'ÜRÜN' }));
                    urundetayDDLiki.append($('<option/>', { value: -1, text: 'ÜRÜN' }));
                    $(data).each(function (index, item) {
                        urunanasinifDDL.append($('<option/>', { value: item.Code, text: item.ProductName }));
                    });
                }
            });



            urunanasinifDDL.change(function () {
                if ($(this).val() == "-1") {
                    urunanasinifDDL.empty();
                    urundetayDDL.append("<option/>", { value: -1, text: 'ÜRÜN SEÇİNİZ' });
                    urundetayDDLiki.append("<option/>", { value: -1, text: 'ÜRÜN SEÇİNİZ' });
                }
                else {
                    $.ajax({
                        url: "AJAX.asmx/GetProductDetailt",
                        data: { NAME: $(this).val() },
                        method: "post",
                        dataType: "json",
                        success: function (data) {
                            urundetayDDL.empty();

                            urundetayDDL.append($('<option/>', { value: -1, text: 'ÜRÜN SEÇİNİZ' }));

                            urundetayDDLiki.empty();

                            urundetayDDLiki.append($('<option/>', { value: -1, text: 'ÜRÜN SEÇİNİZ' }));

                            $(data).each(function (index, item) {
                                urundetayDDL.append($('<option/>', { value: item.CODE, text: item.NAME }));
                                urundetayDDLiki.append($('<option/>', { value: item.CODE, text: item.NAME }));
                            });
                        }
                    });
                }
            });
        });
    </script>
    <script type="text/javascript">

        $(function () {
            $("input[name='konteynerbulksecimi']").click(function () {
                if ($("#konteyner").is(":checked")) {

                    $("#limandolum").hide();
                    //$("#EXW").show();
                    //$("#DAP").show();
                    $("#parcalisiparis").show();
                    $("#parcalikonteyner").show();
                    $("#onaltidort").show();
                    $("#birdenfazlabeyanname").hide();
                    $("input[name='tekliftipi']").click(function () {
                        if ($("#exw").is(":checked")) {
                            $("#kalkislimani").hide();
                            $("#sigortaton").hide();
                            $("#armatorlokali").hide();
                            $("#navlunton").hide();
                            $("#navlun").hide();

                        }
                        else if ($("#fas").is(":checked")) {
                            $("#sigortaton").hide();
                            $("#armatorlokali").hide();
                            $("#navlunton").hide();
                            $("#navlun").hide();
                        }
                        else if ($("#fca").is(":checked")) {
                            $("#sigortaton").hide();
                            $("#armatorlokali").hide();
                            $("#navlunton").hide();
                            $("#navlun").hide();

                        }
                        else if ($("#fob").is(":checked")) {
                            $("#sigortaton").hide();
                            $("#navlunton").hide();
                            $("#navlun").hide();
                        }
                        else if ($("#cfr").is(":checked")) {
                            $("#sigortaton").hide();
                            $("#navlunton").hide();

                        }
                        else if ($("#cıf").is(":checked")) {
                            $("#bukaleminbukonteynerdekitonaji").hide();
                            $("#navlunton").hide();
                            $("#sigortaton").show();
                        }
                        else if ($("#dap").is(":checked")) {
                            $("#sigortaton").hide();
                            $("#navlunton").hide();
                        }

                    })
                }
                else if ($("#bulk").is(":checked")) {
                    $("#limandolum").hide();
                    $("#EXW").hide();
                    $("#DAP").hide();
                    $("#parcalisiparis").hide();
                    $("#parcalikonteyner").hide();
                    $("#birdenfazlabeyanname").show();
                    $("#bos").hide();
                    $("#onaltidort").hide();
                    $("#birkonteynertonaji").hide();
                    $("#sipariskonteynersayisi").hide();
                    $("#ekipmanturu").hide();
                    $("input[name='tekliftipi']").click(function () {
                        if ($("#fas").is(":checked")) {
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                        }
                        else if ($("#fca").is(":checked")) {
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();

                        }
                        else if ($("#fob").is(":checked")) {
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                        }
                        else if ($("#cfr").is(":checked")) {
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                        }
                        else if ($("#cıf").is(":checked")) {
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").show();
                        }

                    });
                }
                else if ($("#roro").is(":checked")) {

                    $("#EXW").hide();
                    $("#DAP").hide();
                    $("#parcalisiparis").hide();
                    $("#parcalikonteyner").hide();
                    $("#birdenfazlabeyanname").show();
                    $("#bos").hide();
                    $("#onaltidort").hide();
                    $("#birkonteynertonaji").hide();
                    $("#sipariskonteynersayisi").hide();
                    $("#ekipmanturu").hide();
                    $("input[name='tekliftipi']").click(function () {
                        if ($("#fas").is(":checked")) {
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                            $("#limandolum").hide();
                        }
                        else if ($("#fca").is(":checked")) {
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                            $("#limandolum").hide();
                        }
                        else if ($("#fob").is(":checked")) {
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                            $("#limandolum").show();
                        }
                        else if ($("#cfr").is(":checked")) {
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").hide();
                            $("#limandolum").show();
                        }
                        else if ($("#cıf").is(":checked")) {
                            $("#navlun").hide();
                            $("#armatorlokali").hide();
                            $("#sigortaton").show();
                            $("#limandolum").show();
                        }

                    });
                }
            });

        });
    </script>
    <script>
        $(document).ready(function () {
            var dolar = $('<%=lbldolar.ClientID%>');
            var euro = $('<%=lbleuro.ClientID%>');

            $.ajax({
                url: "/AJAX.asmx/DovizIslemi",

                method: "post",
                dataType: "json",
                success: function (data) {

                    alert(data.d);
                },
                error: function (err) {
                    console.log(err);
                }
            });


        });
    </script>
    <script>
        $(function () {

            $("input[name='siparistipi']").click(function () {

                if ($("#pkonteyner").is(":checked")) {
                    $("#bukaleminbukonteynerdekitonaji").show();
                }


            });
        });

    </script>
    <script>
        $(function () {
            $("input[name='onaltidort']").click(function () {
                $("#palet").hide();
                $("#onaltidorturundetay").show();
                $("#urun1375").show();
                $("#urun1250").show();
            });

        });


    </script>
    <script>
        function valueChanged() {
            if ($('.ckeuro').is(":checked"))
                $("#divcevir").show();
            else
                $("#divcevir").hide();
        }

    </script>
    <script>
        $(function () {

            $("input[name='musteri']").click(function () {
                if ($("#logomusteri").is(":checked")) {
                    $("#lmusteri").show();
                    $("#digermusteritextbox").hide();
                    //$("#digermusterikodu").hide();
                    $("#tanimlidestinasyon").hide();
                    $("#digerdestinasyon").hide();

                    $("#teslimnoktasi").hide();
                }
                else if ($("#digermusteri").is(":checked")) {
                    $("#lmusteri").hide();
                    $("#digermusteritextbox").show();
                    // $("#digermusterikodu").show();
                    $("#tanimlidestinasyon").hide();
                    $("#digerdestinasyon").hide();
                    $("#varislimani").show();
                    $("#teslimnoktasi").hide();
                }

            });
        });

    </script>
   
  
    <script>
        $(function () {
            $("input[name='ihrackayit']").click(function () {

                if ($("#ihrackayit").is(":checked")) {

                    $("#tanimlidestinasyon").show();
                    $("#digerdestinasyon").show();
                    $("#varislimani").hide();

                    //$("#EXW").hide();
                    //$("#FAS").hide();
                    //$("#FCA").hide();
                    $("#FOB").hide();
                    $("#CFR").hide();
                    $("#CIF").hide();
                    $("#DAP").hide();
                    $("input[name='destination']").click(function () {
                        if ($("#tdes").is(":checked")) {
                            $("#teslimnoktasi").show();
                            $("#inspection").hide();
                            $("#komisyon").hide();
                            $("#armatorlokali").hide();
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#sigortaton").hide();
                            $("#ekipmanturu").hide();
                            $("#kalkislimani").hide();
                            $("#teslimnoktasi2").hide();
                            $("#teslimnoktasiaranakliyeton").hide();
                        }
                        else if ($("#ddes").is(":checked")) {
                            $("#kalkislimani").hide();
                            $("#teslimnoktasi").show();
                            $("#inspection").hide();
                            $("#komisyon").hide();
                            $("#armatorlokali").hide();
                            $("#navlunton").hide();
                            $("#navlun").hide();
                            $("#sigortaton").hide();
                            $("#ekipmanturu").hide();
                            $("#teslimnoktasi").hide();
                            $("#teslimnoktasi2").show();
                            $("#teslimnoktasiaranakliyeton").show();
                        }

                    });

                }
            });

        });
    </script>

    <script>
        $(function () {
            $("input[name='vliman']").click(function () {
                if ($("#tanimliliman").is(":checked")) {
                    $("#varislimani").show();
                    $("#varislimani2").hide();
                }
                else {
                    $("#varislimani").hide();
                    $("#varislimani2").show();
                }
            });
        });

    </script>

    <script type="text/javascript">
        function successAlert() {
            swal({ title: "İŞLEM TAMAMLANDI", text: "Kaydınız Eklendi", type: "success" }).then(function () { window.location = 'TeklifHazirla.aspx' });
        }

    </script>
    <script>
        function sigortaAlert() {
            swal({
                title: "DİKKAT", text: "Sigorta Bölümüne Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function buurununnuekipmandakitonajiAlert() {
            swal({
                title: "DİKKAT", text: "Bu Ürünün Bu Ekipmandaki Tonajı Bölümüne Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function cariAlert() {
            swal({ title: "DİKKAT", text: "Müşteri İsmi Girmediniz", type: "warning" }
                );

        }
    </script>
    <script>
        function urunalert() {
            swal({
                title: "DİKKAT", text: "Ürün Girmediniz", type: "warning"
            });
        }
    </script>

    <script>
        function birekipmanalert() {
            swal({
                title: "DİKKAT", text: "Bir Ekipman Tonajı Kısmına Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function alttekliftipialert() {
            swal({
                title: "DİKKAT", text: "Alt Teklif Tipi Seçmediniz (EXW,FAS,FCA,FOB,CFR,CIF,DAP)", type: "warning"
            });
        }
    </script>
    <script>
        function tekliftipialert() {
            swal({
                title: "DİKKAT", text: "Teklif Tipi Seçmediniz (KONTEYNER veya BULK)", type: "warning"
            });
        }
    </script>
    <script>
        function toplamtonajalert() {
            swal({
                title: "DİKKAT", text: "Bu Ürünün Toplam Tonajı Bölümüne Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function toplamsiparistonajialert() {
            swal({
                title: "DİKKAT", text: "Toplam Sipariş Tonajı Bölümüne Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function siparisekipmansayisi() {
            swal({
                title: "DİKKAT", text: "Sipariş Ekipman Sayısı Bölümüne Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function almatorlokalialert() {
            swal({
                title: "DİKKAT", text: "Armatör Lokali Bölümüne Sayı Değeri Giriniz", type: "warning"
            });
        }
    </script>
    <script>
        function navlunalert() {
            swal({
                title: "DİKKAT", text: "Navlun Bölümüne Sayı Değeri Girinizs", type: "warning"
            });
        }
    </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "HATA", text: "Kaydınız Eklenemedi", type: "error"
            }).then(function () { window.location = "TeklifHazirla.aspx" });
        }
    </script>
    <script type="text/javascript">
        function warningAlert() {
            swal({
                title: "DİKKAT", text: "Herhangi bir kayıt seçmediniz", type: "warning"
            });
        }
    </script>


    <%
        using (SqlConnection con = new SqlConnection(strcon))
        {
            con.Open();
            if (sayi != 0)
            {
                SqlCommand xxx = new SqlCommand("select MusteriTipi,KonteynerBulkSecimi,TeklifTipi from Sepet where TeklifNo='" + txtTeklifNo.Text + "' group by MusteriTipi,KonteynerBulkSecimi,TeklifTipi", con);
                SqlDataAdapter dd = new SqlDataAdapter();
                dd.SelectCommand = xxx;
                DataTable dtt = new DataTable();
                dd.Fill(dtt);
                foreach (DataRow dr in dtt.Rows)
                {
                    if (dr["MusteriTipi"].ToString() == "tanimli")
                    {%>
    <script>
        $(function () {
            $('input:radio[name="musteri"]').filter('[value="logo"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                    else if (dr["MusteriTipi"].ToString() == "diger")
                    {%>
    <script>
        $(function () {
            $('input:radio[name="musteri"]').filter('[value="diger"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                    if (dr["KonteynerBulkSecimi"].ToString() == "KONTEYNER")
                    {%>
    <script>
        $(function () {
            $('input:radio[name="konteynerbulksecimi"]').filter('[value="KONTEYNER"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["KonteynerBulkSecimi"].ToString() == "BULK")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="konteynerbulksecimi"]').filter('[value="BULK"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                    else if (dr["KonteynerBulkSecimi"].ToString() == "RORO")
                    {%>
                           <script>
                               $(function () {
                                   $('input:radio[name="konteynerbulksecimi"]').filter('[value="RORO"]').attr('click', true).trigger("click");
                               });
    </script>
                    <%}
                   if (dr["TeklifTipi"].ToString() == "EXW")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="EXW"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["TeklifTipi"].ToString() == "FAS")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="FAS"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["TeklifTipi"].ToString() == "FCA")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="FCA"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["TeklifTipi"].ToString() == "FOB")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="FOB"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["TeklifTipi"].ToString() == "CFR")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="CFR"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["TeklifTipi"].ToString() == "CIF")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="CIF"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
                   else if (dr["TeklifTipi"].ToString() == "DAP")
                   {%>
    <script>
        $(function () {
            $('input:radio[name="tekliftipi"]').filter('[value="DAP"]').attr('click', true).trigger("click");
        });
    </script>
    <%}
    %>
    <script>
        $(function () {
            $('input:radio[name="vliman"]').filter('[value="tanimliliman"]').attr('click', true).trigger("click");
        });
    </script>
    <%
                }

            }
            SqlConnection.ClearPool(con);
            con.Close();
        }
       
       
    %>



    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <!-- Start Content-->
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="page-title">Teklif Hazırlama</h4>

                    <div class="page-title-right">
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-12">
                <div class="card-box">


                    <div class="row">
                        <div class="col-12">
                            <div class="p-2">
                                <div class="form-group row" id="temsilci" style="display: none">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Temsilci:</label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtTemsilci" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Teklif No:</label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtTeklifNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Teklif Tarihi:</label>
                                    <div class="col-md-10">

                                        <asp:TextBox ID="txtManueltarih" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Bölge:</label>
                                    <div class="col-md-10">

                                        <select id="continents" name="bolge" class="form-control select2">
                                        </select>


                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Ülke</label>
                                    <div class="col-md-10">
                                        <select id="countries" name="ulke" class="form-control select2">
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group row" id="digermusterisec" style="display: inline;">
                                    <label class="col-md-20 col-form-label" for="simpleinput">Müşteri İsmi</label>
                                    <div class="col-md-20">
                                        <input type="radio" value="logo" id="logomusteri" name="musteri" />Tanımlı Müşteri
                                    </div>
                                    <div class="col-md-20">
                                        <input type="radio" value="diger" id="digermusteri" name="musteri" />
                                        Diğer Müşteri
                                    </div>
                                    <br />
                                    <br />
                                    <div id="ihrackayitli" title="deneme">
                                        <label>
                                            <input type="radio" value="ihrackayit" name="ihrackayit" id="ihrackayit" />&nbsp;&nbsp; İhraç Kayıtlı
                                        </label>

                                        <br />
                                        <label id="tanimlidestinasyon" style="display: none">
                                            <input type="radio" name="destination" value="tanimlides" id="tdes" />&nbsp;&nbsp;Tanımlı Destinasyon&nbsp;&nbsp;</label>

                                        <label id="digerdestinasyon" style="display: none">
                                            <input type="radio" name="destination" value="digdes" id="ddes" />&nbsp;&nbsp; Diğer Destinasyon&nbsp;&nbsp;</label>


                                    </div>


                                </div>
                                <div class="form-group row" style="display: none" id="digermusteritextbox">

                                    <label class="col-md-2 col-form-label" for="simpleinput">Müşteri İsmi</label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtDigerMusteri" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="form-group row" style="display: none" id="lmusteri">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Müşteri İsmi</label>
                                    <div class="col-md-10" id="kayitlimusteri">

                                        <%--  <dx:ASPxComboBox ID="cmbMusteriIsmi" runat="server"  CssClass="form-control" EnableTheming="True" Theme="Default" ValueField="CODE" AutoResizeWithContainer="True" DropDownRows="15" Font-Size="Small" TextFormatString="{1}" Width="100%">
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="CODE" Width="30px">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn FieldName="DEFINITION_">
                                                </dx:ListBoxColumn>

                                            </Columns>
                                            <ItemStyle Font-Size="Small" />
                                            <ListBoxStyle Font-Size="Small">
                                            </ListBoxStyle>
                                            <ClearButton DisplayMode="OnHover">
                                            </ClearButton>

                                        </dx:ASPxComboBox>--%>
                                        <asp:DropDownList ID="cmbMusteri" runat="server" CssClass="form-control select2">
                                        </asp:DropDownList>


                                    </div>
                                </div>

                                <div class="form-group row" id="varislimanisec" style="display: inline;">
                                    <label class="col-md-20 col-form-label" for="simpleinput">Varış Limanı</label>
                                    <div class="col-md-20">
                                        <input type="radio" value="tanimliliman" id="tanimliliman" name="vliman" />Tanımlı Liman
                                    </div>
                                    <div class="col-md-20">
                                        <input type="radio" value="digerliman" id="digerliman" name="vliman" />
                                        Diğer Liman
                                    </div>
                                    <br />
                                    <br />
                                </div>



                                <div class="form-group row" id="varislimani" style="display: none">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Varış Limanı:</label>
                                    <div class="col-md-10">
                                        <%-- <asp:DropDownList ID="drpvarislimani" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Liman Seçiniz"></asp:ListItem>
                                        </asp:DropDownList>--%>

                                        <select id="ports" name="liman" class="form-control"></select>
                                        <%--   <script>
                                            $('#<%=drpvarislimani.ClientID%>').chosen();
                                        </script>--%>
                                    </div>
                                </div>
                                <div class="form-group row" id="varislimani2" style="display: none">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Varış Limanı:</label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtvarislimani" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row" id="teslimnoktasi" style="display: none">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Teslim Noktası:</label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="drpTeslimNoktasi" runat="server" CssClass="form-control">
                                            <%-- <asp:ListItem Text="Fabrika Teslim"></asp:ListItem>
                                                    <asp:ListItem Text="Mersin"></asp:ListItem>
                                                    <asp:ListItem Text="İskenderun"></asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <%-- <script>
                                                    $('#<%=drpTeslimNoktasi.ClientID%>').chosen();
                                                </script>--%>
                                    </div>
                                </div>
                                <div class="form-group row" id="teslimnoktasi2" style="display: none">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Teslim Noktası:</label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtTeslimNoktasi" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="form-group row" id="teslimnoktasiaranakliyeton" style="display: none">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Teslim Noktası Ara Nakliye/TON($):</label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtteslimnoktasiaranakliyeton" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="simpleinput">Vade:</label>
                                    <div class="col-md-10">

                                        <asp:DropDownList ID="DrpVade" runat="server" CssClass="form-control">

                                            <asp:ListItem>Vade Seçiniz</asp:ListItem>

                                        </asp:DropDownList>

                                    </div>

                                </div>


                                <div class="form-group row" id="konteynerbulksecimi" title="deneme">
                                    <label class="col-md-2 col-form-label">KONTEYNER-BULK SEÇİMİ</label>
                                    <div class="col-md-10">
                                        <label for="KONTEYNER">
                                            <input type="radio" name="konteynerbulksecimi" value="KONTEYNER" id="konteyner" />&nbsp;&nbsp;KONTEYNER&nbsp;&nbsp;</label>

                                        <label for="BULK">
                                            <input type="radio" name="konteynerbulksecimi" value="BULK" id="bulk" />&nbsp;&nbsp;BULK&nbsp;&nbsp;</label>
                                         <label for="BULK">
                                            <input type="radio" name="konteynerbulksecimi" value="RORO" id="roro" />&nbsp;&nbsp;RORO&nbsp;&nbsp;</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="simpleinput"></label>
                                <div class="col-md-10">
                                    <%--<input type="text" id="simpleinput" class="form-control" value="">--%>
                                </div>
                            </div>
                            <div class="form-group row" id="tekliftipi">
                                <label class="col-md-2 col-form-label" for="simpleinput">Gönderim Şekli:</label>
                                <div class="col-md-10">
                                    <label id="EXW">
                                        <input type="radio" id="exw" name="tekliftipi" value="EXW">EXW</label>

                                    <label id="FAS">
                                        <input type="radio" id="fas" name="tekliftipi" value="FAS">FAS</label>

                                    <label id="FCA">
                                        <input type="radio" id="fca" name="tekliftipi" value="FCA">FCA</label>

                                    <label id="FOB">
                                        <input type="radio" id="fob" name="tekliftipi" value="FOB">
                                        FOB</label>

                                    <label id="CFR">
                                        <input type="radio" id="cfr" name="tekliftipi" value="CFR">CFR</label>

                                    <label id="CIF">
                                        <input type="radio" id="cıf" name="tekliftipi" value="CIF">CIF</label>

                                    <label id="DAP">
                                        <input type="radio" id="dap" name="tekliftipi" value="DAP">
                                        DAP</label>
                                </div>

                                <div style="margin-left: 200px;" id="parcalisipkon">
                                    <div class="form-group row" id="parcalisiparis" style="display: relative;">
                                        <label class="col-md-10 col-form-label" for="simpleinput">Parçalı Sipariş</label>
                                        <div class="col-md-10">
                                            <input type="checkbox" id="psiparis" value="parcalisiparis" name="siparistipi" />
                                        </div>
                                    </div>
                                    <div class="form-group row" id="parcalikonteyner" style="display: inline;">
                                        <label class="col-md-20 col-form-label" for="simpleinput">Parçalı Konteyner</label>
                                        <div class="col-md-20">
                                            <input type="checkbox" value="parcalikonteyner" id="pkonteyner" name="siparistipi" />
                                        </div>
                                    </div>
                                    <div class="form-group row" id="onaltidort" style="display: inline;">
                                        <label class="col-md-20 col-form-label" for="simpleinput">16 + 4</label>
                                        <div class="col-md-20">
                                            <input type="checkbox" value="onaltidort" id="onaltiyadort" name="onaltidort" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="birdenfazlabeyanname" style="display: none">
                                <label class="col-md-2 col-form-label" for="simpleinput"></label>
                                <div class="col-md-10">
                                    <label for="BİRDENFAZLABEYANNAME">
                                        <input type="checkbox" name="birdenfazlabeyanname" value="Birden Fazla Beyanname" id="bfazlabeyanname" />&nbsp;&nbsp;Birden Fazla Beyanname&nbsp;&nbsp;</label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="simpleinput">ÜRÜN ÜST SINIF:</label>
                                <div class="col-md-10">
                                    <select id="urunanasinif" class="form-control select2" name="urunanasinif">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="simpleinput">Ürün <b id="urun1375" style="display: none">(1375)</b>:</label>
                                <div class="col-md-10">

                                    <select id="urundetay" class="form-control select2" name="urundetay"></select>
                                </div>
                            </div>
                            <div class="form-group row" id="onaltidorturundetay" style="display: none">
                                <label class="col-md-2 col-form-label" for="simpleinput">Ürün <b id="urun1250" style="display: none">(1250)</b>:</label>
                                <div class="col-md-10">

                                    <select id="urundetay2" class="form-control select2" name="urundetay2"></select>
                                </div>
                            </div>
                            <div class="form-group row" id="torbatipi">
                                <label class="col-md-2 col-form-label" for="simpleinput">Torba Tipi:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="drpTorbaTipi" runat="server" CssClass="form-control">
                                        <asp:ListItem>Torba Tipi Seçiniz</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group row" id="torbaagirligi">
                                <label class="col-md-2 col-form-label" for="simpleinput">Torba Ağırlığı:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DrpTorbaAgirligi" runat="server" CssClass="form-control">
                                        <asp:ListItem>Torba Ağırlığı Seçiniz</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group row" id="bbtipi">
                                <label class="col-md-2 col-form-label" for="simpleinput">BB Tipi:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DrpBBTipi" runat="server" CssClass="form-control">
                                        <asp:ListItem>BB Tipi Seçiniz</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group row" id="bbagirligi">
                                <label class="col-md-2 col-form-label" for="simpleinput">BB Ağırlığı:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="drpBBAgirligi" runat="server" CssClass="form-control">
                                        <asp:ListItem>BB Ağırlığı Seçiniz</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group row" id="palet">
                                <label class="col-md-2 col-form-label" for="simpleinput">Palet:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DrpPalet" runat="server" CssClass="form-control">
                                        <asp:ListItem>&nbsp;</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="form-group row" id="palettipi">
                                <label class="col-md-2 col-form-label" for="simpleinput">Palet Tipi:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="drpPaletTipi" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="form-group row" id="inspection">
                                <label class="col-md-2 col-form-label" for="simpleinput">Inspection TON($)</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtInspectionTon" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="komisyon">
                                <label class="col-md-2 col-form-label" for="simpleinput">Distribütör Komisyonu:</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtKomisyon" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="ekipmanturu">
                                <label class="col-md-2 col-form-label" for="simpleinput">Ekipman Türü:</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DrpEkipmanTuru" runat="server" CssClass="form-control" OnSelectedIndexChanged="DrpEkipmanTuru_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem>Ekipman Türü Seçiniz</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="form-group row" id="kalkislimani">
                                <asp:Label ID="lblKalkisLimani" runat="server" CssClass="col-md-2 col-form-label">Kalkış Limanı:</asp:Label>
                                <div class="col-md-10">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="DrpKalkisLimani" runat="server" CssClass="form-control">
                                                <asp:ListItem>Kalkış Limanı Seçiniz</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DrpEkipmanTuru" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                </div>
                            </div>
                            <div class="form-group row" id="birkonteynertonaji">
                                <label class="col-md-2 col-form-label" for="simpleinput">1 Ekipman Tonajı:</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtBirKonteynerTonaji" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>



                                </div>
                            </div>
                            <div class="form-group row" id="bukaleminbukonteynerdekitonaji" style="display: none">
                                <label class="col-md-2 col-form-label" for="simpleinput">Bu Ürünün Bu Ekipmandaki Tonajı</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtBukaleminBuKonteynerdekiTonaji" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="buurununtoplamtonaji">
                                <label class="col-md-2 col-form-label" for="simpleinput">Bu Ürünün Toplam Tonajı:</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtbuurununtoplamtonaji" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="toplamsiparistonaji">
                                <label class="col-md-2 col-form-label" for="simpleinput">Toplam Sipariş Tonajı:</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtSiparisTonaji" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="sipariskonteynersayisi">
                                <label class="col-md-2 col-form-label" for="simpleinput">Sipariş Ekipman Sayısı</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="TextBoxSiperisKonteynerSayisi" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="form-group row" id="armatorlokali">
                                        <label class="col-md-2 col-form-label" for="simpleinput">Armatör Lokali($):</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtArmatörLokali" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DrpEkipmanTuru" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>


                            <div class="form-group row" id="navlun">
                                <label class="col-md-2 col-form-label" for="simpleinput">Navlun($):</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtNavlun" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="form-group row" id="navlunton">
                                        <label class="col-md-2 col-form-label" for="simpleinput">Navlun/TON($)</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtNavlunTON" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DrpEkipmanTuru" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">

                                <ContentTemplate>
                                    <div class="form-group row" id="sigortaton" style="display:none">
                                        <label class="col-md-2 col-form-label" for="simpleinput">Sigorta/TON($):</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtSigorta" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DrpEkipmanTuru" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                                <div class="form-group row" id="limandolum" style="display:none">
                                        <label class="col-md-2 col-form-label" for="simpleinput">Liman Dolum/TON($):</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtLimanDolum" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                    </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="simpleinput">Parsiyel</label>
                                <div class="col-md-10">
                                    <asp:CheckBox ID="chkParsiyel" runat="server" Text="&nbsp;Parsiyel" />
                                </div>
                            </div>
                            <div class="col-auto">
                                <div class="mt-2">
                                    <asp:Button ID="btnEkle" runat="server" CssClass="btn btn-info" Text="Ekle" Height="40px" OnClick="btnEkle_Click" />
                                </div>
                            </div>

                            <div class="col-md-999" id="kayitlar" style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                                <label class="col-md-2 col-form-label" for="simpleinput" style="float: left">Kayıtlar</label>
                                <div class="col-md-999">

                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="Id" Width="100%" Theme="Moderno" CssClass="GridTemplate">
                                        <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" ShowHeaderFilterBlankItems="False" />
                                        <SettingsDataSecurity AllowEdit="False" />
                                        <SettingsPopup>
                                            <HeaderFilter ShowHeader="True" />
                                        </SettingsPopup>
                                        <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                        <SettingsText CommandEdit="S.Fiyat Gir" CommandCancel="İptal" CommandDelete="Sil" CommandUpdate="Gir" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Caption="DÜZENLE">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True" Visible="false">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="UrunFiyat" VisibleIndex="3" Caption="Ürün<br/>Fiyat" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TorbaTipi" VisibleIndex="4" Caption="Torba<br/>Tipi" Width="65px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" VisibleIndex="5" Caption="Torba<br/>Ağrlığı" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="BBTipi" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="BBAgirligi" VisibleIndex="7" Width="50px" Caption="BB<br/>Ağırlığı">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Palet" VisibleIndex="8" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Ambalaj" VisibleIndex="9" Width="55px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GumruklemeTON" VisibleIndex="19" Caption="Gümrükleme<br/>TON" Width="75px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Inspection" VisibleIndex="11" Width="70px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Komisyon" VisibleIndex="12" Width="60px">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" VisibleIndex="13" Caption="Ara<br/>Nakliye<br/>TON" Width="65px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="DepolamaTON" VisibleIndex="14" Caption="Depolama<br/>TON" Width="65px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ArmatorLokali" VisibleIndex="16" Width="65px" Caption="Armatör<br/>Lokali">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" VisibleIndex="15" Caption="Liman<br/>İç<br/>Dolum" Width="65px">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="NavlunTON" VisibleIndex="17" Caption="Navlun" Width="75px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SigortaTON" VisibleIndex="18" Caption="Sigorta" Width="50px">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" VisibleIndex="22" Caption="T.Şekli<br/>Maliyet" Width="70px">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" VisibleIndex="23" Caption="Satış<br/>Fiyatı" Width="65px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="fobKarOrani" VisibleIndex="21" Caption="FOB<br/>Kar<br/>Oranı<br/>(%)" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" VisibleIndex="20" Caption="FOB<br/>Satış<br/> Fiyatı" Width="55px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="FobMaliyet" VisibleIndex="19" Caption="FOB<br/>Maliyet" Width="60px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="24" Caption="T.Şekli<br/>Kar<br/>Oranı<br/>(%)" Width="50px" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="25" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ReelKar" VisibleIndex="26" Caption="Farklılık" Width="60px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ReelKarOrani" VisibleIndex="27" Caption="Kar<br/>Orani(%)" Width="60px">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles>
                                            <Header Font-Size="Small">
                                            </Header>
                                            <DetailRow Font-Size="Small" Wrap="True">
                                            </DetailRow>
                                            <DetailCell Font-Size="X-Small">
                                            </DetailCell>
                                            <FocusedRow BackColor="#FFCC99">
                                            </FocusedRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <EditFormDisplayRow Font-Size="X-Small">
                                            </EditFormDisplayRow>
                                            <EditingErrorRow Font-Size="X-Small">
                                            </EditingErrorRow>
                                            <EditForm Font-Size="X-Small" Wrap="True">
                                            </EditForm>
                                            <EditFormCell Font-Size="X-Small">
                                            </EditFormCell>
                                            <EditFormTable Font-Size="X-Small">
                                            </EditFormTable>
                                            <EditFormColumnCaption Font-Size="X-Small">
                                            </EditFormColumnCaption>
                                        </Styles>

                                    </dx:ASPxGridView>




                                </div>
                            </div>
                            <div class="col-md-999" style="width: 100%;" id="istek">
                               
                                <asp:UpdatePanel ID="up" runat="server">


                                    <ContentTemplate>
                                        <asp:Panel ID="pnlHider" runat="server" CssClass="hider" Visible="false">
                                        </asp:Panel>
                                        <input type="button" value="GÜNCELLE" class="btn btn-info" onclick="document.location.reload(true);" style="height: 40px;">
                                        <asp:Button ID="btnModalPopupGoster" runat="server" Text="FİYAT GİR" CssClass="btn btn-warning" OnClick="btnModalPopupGoster_Click" Height="40px" />

                                        <asp:Panel ID="pnlKayitEkle" runat="server" Visible="false" CssClass="popupbox" DefaultButton="btnEkle">
                                            <div class="card">
                                                <div>
                                                    UDS KUR($):<asp:Label ID="lbldolar" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    EURO KUR(€):<asp:Label ID="lbleuro" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    PARİTE(€/$):<asp:Label ID="lblParite" runat="server"></asp:Label>
                                                </div>

                                                <div class="card-body p-4">

                                                    <div class="form-group mb-3">
                                                        Teslim Şekli Maliyeti :<asp:Label ID="lblKalemMaliyet" runat="server"></asp:Label>&nbsp;&nbsp;<br />
                                                        <br />
                                                        <div id="divcevir">
                                                            <asp:Label ID="lbleuro2" runat="server"></asp:Label>
                                                        </div>
                                                        <div id="divcevir2">
                                                            <asp:Label ID="lbltl2" runat="server"></asp:Label>
                                                        </div>

                                                        <label for="emailaddress">Satış Fiyatı</label>
                                                        <asp:TextBox ID="txtTeslimSekliSatisFİyati" runat="server" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group mb-3">
                                                        FOB Maliyeti :<asp:Label ID="lblfobmaliyet" runat="server"></asp:Label><br />
                                                      
                                                      
                                                        <label for="password">FOB Satış Fiyatı</label>
                                                        <asp:TextBox ID="txtFobSatisFiyati" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <div class="form-group mb-0 text-center">
                                                            <asp:Button ID="btnekle2" runat="server" Text="KAYDET" CssClass="btn btn-primary btn-block" OnClick="btnEkle2_Click" />

                                                        </div>
                                                           <div class="form-group mb-0 text-center">
                                                            <asp:Button ID="Button1" runat="server" Text="KUR ÇEVİR" CssClass="btn btn-warning btn-block" OnClick="Button1_Click" />

                                                        </div>

                                                        <div class="form-group mb-0 text-center">
                                                            <asp:Button ID="btnKapat" runat="server" Text="VAZGEÇ" CssClass="btn btn-danger btn-block" OnClick="lbModalPopupKapat_Click" />

                                                        </div>

                                                    </div>
                                                     <div class="form-group mb-0 text-center">
                                                        <table class="table table-bordered">
                                                           
                                                               <tr>
                                                               
                                                                   <td>Euro Fob Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbleurofob" runat="server"></asp:Label>
                                                                   </td>
                                                                   <td>TL Fob Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbltlfob" runat="server"></asp:Label>
                                                                   </td>
                                                               </tr>
                                                             <tr>
                                                               
                                                                   <td>Euro  Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbleurocfr" runat="server"></asp:Label>
                                                                   </td>
                                                                   <td>TL  Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbltlcfr" runat="server"></asp:Label>
                                                                   </td>
                                                               </tr>
                                                        </table>
                                                        
                                                        </div>


                                                </div>


                                              

                                                <!-- end card-body -->
                                            </div>

                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                           





                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="100%" KeyFieldName="Id" Theme="Moderno" CssClass="GridTemplate">
                                    <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" ShowHeaderFilterBlankItems="False" />
                                    <SettingsPopup>
                                        <HeaderFilter ShowHeader="True" />
                                    </SettingsPopup>
                                    <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="1" Caption="Teklif Tipi" Width="130px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="2" Caption="Ürün" Width="150px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" VisibleIndex="3" Caption="Tonaj">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" VisibleIndex="4" Caption="Br<br/>Maliyet">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" VisibleIndex="5" Caption="Br Satış Fiyatı">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ToplamMaliyet" VisibleIndex="6" ReadOnly="True" Caption="Toplam<br/>Maliyet">
                                        </dx:GridViewDataTextColumn>


                                        <dx:GridViewDataTextColumn FieldName="Column1" VisibleIndex="7" ReadOnly="True" Caption="Toplam<br/>Tutar">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="Column2" VisibleIndex="8" ReadOnly="True" Caption="Toplam<br/>Fark" Width="150px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fobKarOrani" VisibleIndex="9" Caption="FOB Kar<br/>Oranı" Width="150px">
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="10" Caption="Teslim Şekli<br/>Kar Oranı" Width="150px">
                                        </dx:GridViewDataTextColumn>

                                    </Columns>
                                    <Styles>
                                        <Header Font-Size="Small">
                                        </Header>
                                        <DetailRow Font-Size="Small" Wrap="True">
                                        </DetailRow>
                                        <DetailCell Font-Size="X-Small">
                                        </DetailCell>
                                        <FocusedRow BackColor="#FFCC99">
                                        </FocusedRow>
                                        <Cell Font-Size="Small">
                                        </Cell>
                                        <EditFormDisplayRow Font-Size="X-Small">
                                        </EditFormDisplayRow>
                                        <EditingErrorRow Font-Size="X-Small">
                                        </EditingErrorRow>
                                        <EditForm Font-Size="X-Small" Wrap="True">
                                        </EditForm>
                                        <EditFormCell Font-Size="X-Small">
                                        </EditFormCell>
                                        <EditFormTable Font-Size="X-Small">
                                        </EditFormTable>
                                        <EditFormColumnCaption Font-Size="X-Small">
                                        </EditFormColumnCaption>
                                    </Styles>

                                </dx:ASPxGridView>

                            </div>
                            <%
                                if (ExternalTrade.Classes.UserData.Authority != "SuperAdmın")
                                {%>
                            <div><a href="popup.aspx" target="_blank" class="btn btn-success" style="height: 40px;">Teklifi Görüntüle</a></div>
                            <%}    
                            %>
                        </div>
                    </div>

                </div>
                <!-- end row -->

            </div>
            <!-- end card-box -->
        </div>

        <!-- end col -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [Product]" OnSelecting="SqlDataSource1_Selecting1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT [Id] ,[Urun], [UrunFiyat], [TorbaTipi], [TorbaAgirligi], [BBTipi], [BBAgirligi], [Palet], [Ambalaj],[GumruklemeTON], [Inspection], [Komisyon], [AraNakliyeTON], [DepolamaTON], [ArmatorLokali], [LimanIcDolumBedeliTON], [NavlunTON],[SigortaTON],[KalemMaliyeti], [KalemSatisFiyati],[fobKarOrani],[FobMaliyet],[teslimsekliKarOrani],[TeklifTipi],[FobSatisFiyati],[ReelKar],[ReelKarOrani] FROM [Sepet] where [TemsilciKullaniciAdi]=@temsilci" OnSelecting="SqlDataSource2_Selecting" DeleteCommand="delete from Sepet where Id=@Id" UpdateCommand="UpdateSepet" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="temsilci" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FobMaliyet" />
                <asp:Parameter Name="KalemSatisFiyati" />
                <asp:Parameter Name="Id" />
                <asp:Parameter Name="fobKarOrani" />
                <asp:Parameter Name="teslimsekliKarOrani" />
                <asp:Parameter Name="TeklifTipi" />
                <asp:Parameter Name="UrunFiyat" />
                <asp:Parameter Name="Ambalaj" />
                <asp:Parameter Name="GumruklemeTON" />
                <asp:Parameter Name="Inspection" />
                <asp:Parameter Name="AraNakliyeTON" />
                <asp:Parameter Name="DepolamaTON" />
                <asp:Parameter Name="ArmatorLokali" />
                <asp:Parameter Name="LimanIcDolumBedeliTON" />
                <asp:Parameter Name="KalemMaliyeti" />
                <asp:Parameter Name="NavlunTON" />
                <asp:Parameter Name="SigortaTON" />
                <asp:Parameter Name="FobSatisFiyati" />
                <asp:Parameter Name="Komisyon" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="OzetTablo" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Sepet WHERE (Id = @Id)" OnSelecting="SqlDataSource4_Selecting">
            <SelectParameters>
                <asp:Parameter Name="TemsilciKullaniciAdi" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>

        </asp:SqlDataSource>
    </div>
    <!-- end row -->



    <!-- end row -->


    <!-- Inline Form -->

    <!-- end row -->


    <!-- Form row -->

    <!-- end row -->




</asp:Content>
