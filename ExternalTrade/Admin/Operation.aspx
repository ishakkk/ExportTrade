<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Operation.aspx.cs" Inherits="ExternalTrade.Admin.Operation" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         /*.GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }*/
         .baslik{
             font-size:7px;
         }
    </style>

     

   
<script>
    function successAlert() {
        swal({
            title: "İŞLEM TAMAMLANDI", text: "Operasyon Onayı Verildi", type: "success"

        }).then(function () { window.location = "Operation.aspx"; });
    }

    function errorAlert() {
        swal({
            title: "İŞLEM TAMAMLANAMADI", text: "Operasyon Onayı Verilemedi", type: "error"

        }).then(function () { window.location = "Operation.aspx"; });
    }
    function successAlert2() {
        swal({
            title: "İŞLEM TAMAMLANDI", text: "Operasyon Onayı Reddedildi", type: "success"

        }).then(function () { window.location = "Operation.aspx"; });
    }

    function errorAlert2() {
        swal({
            title: "İŞLEM TAMAMLANAMADI", text: "Operasyon Onayı Reddedilemedi", type: "error"

        }).then(function () { window.location = "Operation.aspx"; });
    }
</script>
   
     <script>
         function sec() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
             });
         }
    </script>
      <script>
          $(document).ready(function () {
              $("#myInput").on("keyup", function () {
                  var value = $(this).val().toLocaleLowerCase();
                  $("#tbl tr").filter(function () {
                      $(this).toggle($(this).text().toLocaleLowerCase().indexOf(value) > -1);

                  });
              });

          });
    </script>

      
         

    <div class="row" style:"width:100%;">
        <h1>OPERASYON DÖKÜMÜ ONAYI BEKLEYEN</h1>
        <div class="col-16" style="width:100%;"><br />
           
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" KeyFieldName="TeklifNo">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Visible" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto"  VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowDragDrop="false"/>
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                             <Columns>
                                                 <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                                                 </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="SatisOnayiVeren" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px"  Caption="SAYIŞ ONAYI<br/>VEREN" VisibleIndex="13" ReadOnly="True">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Width="100%" Caption="TEKLİF NO" VisibleIndex="1">
                                                     
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                     
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" Width="100%" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="TEMSİLCİ" VisibleIndex="2">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="MusteriIsmi" Width="100%" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="MÜŞTERİ" VisibleIndex="4">
                                                       <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriKodu" Visible="false"  VisibleIndex="5">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Ulke" Caption="ÜLKE" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="3">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TOPLAM TONAJ" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="TOPLAM TONAJ" ReadOnly="True" VisibleIndex="6" >
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FOB KAR ORANI1" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="ONAY ÖNCESI<br/>FOB VE ÖNCESİ<br/>KAR ORANI(%)" ReadOnly="True" VisibleIndex="8" >
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="FOB KAR ORANI2" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="ONAY SONRASI<br/>FOB VE ÖNCESİ<br/>KAR ORANI(%)" ReadOnly="True" VisibleIndex="9">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="CFR KAR ORANI" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="ONAY ÖNCESI<br/>CFR<br/>KAR ORANI(%)" ReadOnly="True" VisibleIndex="10">
                                                            <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                 <dx:GridViewDataTextColumn FieldName="CFR KAR ORANI2" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" Caption="ONAY SONRASI<br/>CFR<br/>KAR ORANI(%)" ReadOnly="True" VisibleIndex="11">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataDateColumn FieldName="TTarih" Caption="TEKLİF TARİHİ" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="12">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                 </dx:GridViewDataDateColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="GÖNDERİM<br/>ŞEKLİ" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="7">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                         
                                                
                                            </Columns>
                                                                   <%--    <Styles>
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
                              
                               
                                <EditFormColumnCaption Font-Size="X-Small">
                                </EditFormColumnCaption>
                            </Styles>--%>

                                        </dx:ASPxGridView>
                           
                      </div>
                 

                    </div>
       <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" OnClick="btnRapor_Click" CssClass="btn btn-danger"  Height="40px"/>
                
         <asp:Button ID="btnTeklifOnay" runat="server" Text="ONAYLA" OnClick="btnTeklifOnay_Click" CssClass="btn btn-success"  Height="40px"/>
         <asp:Button ID="Button1" runat="server" Text="REDDET" OnClick="Button1_Click" CssClass="btn btn-dark"  Height="40px"/>
                  <asp:Button ID="Button2" runat="server" Text="RAPOR AL" CssClass="btn btn-primary"  Height="40px" OnClick="Button2_Click"/>
                   
              
           <%--<input type="button" style="height:40px" data-toggle="modal"  data-target="#exampleModalScrollable" class="btn btn-warning" value="REVİZE ET"/>--%>
           <%-- <input type="button" class="btn btn-warning" value="REVİZE ET" id="btnaciklama" style="height:40px;"/>--%>
              <div>
         
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
            
  
      
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT u.Name+' '+u.SurName as [SatisOnayiVeren], o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.MusteriKodu,o.[Ulke],CAST(SUM(o.[buUrununSiparisTonaji]) as decimal(18,3)) as [TOPLAM TONAJ], 
case when o.TeklifTipi='EXW' or o.TeklifTipi='FAS' or o.TeklifTipi='FCA' or o.TeklifTipi='FOB' Or o.TeklifTipi='YOK' then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP' or  o.TeklifTipi='DAT' then CAST((SUM(o.[FobSatisFiyati])-SUM(o.[FobMaliyet]))/SUM(o.[FobMaliyet]) as decimal(18,3))  end AS [FOB KAR ORANI1],

case
when o.TeklifTipi='EXW' or o.TeklifTipi='FAS' or o.TeklifTipi='FCA' or o.TeklifTipi='FOB' Or o.TeklifTipi='YOK'

then


case   

	when o.MusteriKodu='120.02.00003' then 

CAST((SUM(o.[KalemSatisFiyati])-SUM(((p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali))/SUM(((p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali) as decimal(18,3)) 

when o.MusteriKodu='120.02.00004'

then CAST((SUM(o.[KalemSatisFiyati])-SUM(((p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali))/SUM(((p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali) as decimal(18,3)) 

when  o.MusteriKodu='120.02.00121' 

then CAST((SUM(o.[KalemSatisFiyati])-SUM(((Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali))/SUM(((p.Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali) as decimal(18,3)) 
	else

	CAST((SUM(o.[KalemSatisFiyati])-SUM(((p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali))/SUM(((p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali)*o.VadeCarpani/100)+p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali) as decimal(18,3)) 

end


end 

as 
[FOB KAR ORANI2],

case  when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP' or  o.TeklifTipi='DAT'
then  CAST((SUM(o.[KalemSatisFiyati])-SUM(KalemMaliyeti))/SUM(KalemMaliyeti) as decimal(18,3)) 
end as [CFR KAR ORANI]

,


case  when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP' or  o.TeklifTipi='DAT'
then
case   

	when o.MusteriKodu='120.02.00003' then 

CAST((SUM(o.[KalemSatisFiyati])-SUM(((p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON))/SUM(((p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+p.Price_Intercarb+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON) as decimal(18,3)) 

when o.MusteriKodu='120.02.00004'

then CAST((SUM(o.[KalemSatisFiyati])-SUM(((p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON))/SUM(((p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+p.Price_Roskim+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON) as decimal(18,3)) 

when  o.MusteriKodu='120.02.00121' 

then CAST((SUM(o.[KalemSatisFiyati])-SUM(((Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON))/SUM(((p.Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+Price_Ozer+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON) as decimal(18,3)) 
	else

	CAST((SUM(o.[KalemSatisFiyati])-SUM(((p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON))/SUM(((p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON)*o.VadeCarpani/100)+p.Price+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.ArmatorLokali+o.NavlunTON+o.SigortaTON) as decimal(18,3)) 

end
end AS [CFR KAR ORANI2],o.TTarih,o.TeklifTipi,DATEDIFF(day,TTarih,ISNULL(SatisOnayiGondermeTarihi,TTarih)) as TarihFarki FROM [Orders] o left outer join Users u on o.SatisOnayiVeren=u.Id
left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo 
left outer join Product p on o.UrunKodu=p.Code
where o.KILIT=0 and (o.[Durum]='ONAYLANDI' or o.[Durum]='SATISA DONDU') and a.OperationAllow=1 group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],u.Name+' '+u.SurName,o.TTarih,o.TeklifTipi,SatisOnayiGondermeTarihi,o.MusteriKodu order by o.TTarih desc" >
  
        </asp:SqlDataSource>

</asp:Content>


