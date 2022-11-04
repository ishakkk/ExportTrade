<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popup.aspx.cs" Inherits="ExternalTrade.popup" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="assets/js/jquery-3.5.1.min.js"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script type="text/javascript">
    function successAlert() {
        swal({
            title: "İŞLEM TAMAM", text: "Teklifiniz Onaya Gönderildi", type: "success"
        }).then(function () { window.location = "popup.aspx"; });
    }
</script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Oluşturulamadı", type: "error"
            }).then(function () { window.location = "popup.aspx"; });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

    <div class="col-md-999" id="kayitlar" style="width: 100%;  overflow-x: scroll; overflow-y: scroll;">
       
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Theme="Moderno" CssClass="GridTemplate" >
            <SettingsPager PageSize="20">
            </SettingsPager>
           <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollableHeight="700" />
                                 <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" ShowHeaderFilterBlankItems="False" />
                                <SettingsPopup>
                                    <HeaderFilter ShowHeader="True" />
                                </SettingsPopup>
                                <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                               <Columns>
                                   <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                       <EditFormSettings Visible="False" />
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="1">
                                       <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" VisibleIndex="2">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="birdenfazlabeyanname" VisibleIndex="3">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="siparisTipi" VisibleIndex="4">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Vade" VisibleIndex="5">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="6">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="7">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TemsilciKullaniciAdi" VisibleIndex="8" Visible="false">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="9">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Kita" VisibleIndex="10">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="11">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="KalkisLimani" VisibleIndex="12">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="EkipmanTuru" VisibleIndex="13">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="VarisLimani" VisibleIndex="14">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="15">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="16">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="UrunFiyat" VisibleIndex="17">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TorbaTipi" VisibleIndex="18">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" VisibleIndex="19">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="BBTipi" VisibleIndex="20">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="BBAgirligi" VisibleIndex="21">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Palet" VisibleIndex="22">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="birKonteynerTonaji" VisibleIndex="23">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="BuKaleminBuKonteynerdekiTonaji" VisibleIndex="24">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Ambalaj" VisibleIndex="25">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" VisibleIndex="26">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="UrununKonteynerSayisi" VisibleIndex="27">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="SiparistekiKonteynerSayisi" VisibleIndex="28">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="GumruklemeTON" VisibleIndex="29">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Inspection" VisibleIndex="30">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Komisyon" VisibleIndex="31">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" VisibleIndex="32">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="DepolamaTON" VisibleIndex="33">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="ArmatorLokali" VisibleIndex="34">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" VisibleIndex="35">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="NavlunTON" VisibleIndex="36">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="MaliyetTON" VisibleIndex="37">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="SatisFiyatiTON" VisibleIndex="38">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TeklifTarihi" VisibleIndex="39">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" VisibleIndex="40">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" VisibleIndex="41">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="SigortaTON" VisibleIndex="42">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="fobKarOrani" VisibleIndex="43">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="FobMaliyet" VisibleIndex="44">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="45">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Durum" VisibleIndex="46">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Statu" VisibleIndex="47">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Parsiyel" VisibleIndex="48">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="49">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Gun" VisibleIndex="50">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Ay" VisibleIndex="51">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Yil" VisibleIndex="52">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" VisibleIndex="53">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="ReelKar" VisibleIndex="54" Caption="Kar">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="ReelKarOrani" VisibleIndex="55" Caption="Kar Oranı">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                       </SettingsHeaderFilter>
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
        
 
            
        <asp:Button ID="Button1" runat="server" Text="TEKLİF ONAYA SUN" CssClass="btn btn-warning" OnClick="Button1_Click" Height="40px"/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [Sepet] where [Temsilci]=@temsilci" OnSelecting="SqlDataSource1_Selecting">

            <SelectParameters>
                <asp:Parameter Name="temsilci" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     
    </form>
</body>
</html>