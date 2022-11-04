<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AcikGemi.aspx.cs" Inherits="ExternalTrade.Admin.AcikGemi" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
      <div class="row" style:"width:100%;">
        <div class="col-12" style="width:100%;"><br />
              <div class="form-group row">
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                     <dx:ASPxGridView Width="100%" ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" CssClass="GridTemplate"  KeyFieldName="SİPARİŞ NO">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"/>
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="SİPARİŞ NO" VisibleIndex="0" Caption="SİPARİŞ<br/> NO" Width="70px">
                                                  
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="SİPARİŞ TARİHİ" VisibleIndex="1" Caption="SİPARİŞ<br/>TARİHİ" Width="70px">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="SİPARİŞ DURUMU" VisibleIndex="2" Caption="SİPARİŞ<br/>DURUMU" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MÜŞTERİ" VisibleIndex="3" Caption="MÜŞTERİ" Width="250px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ÜLKE" VisibleIndex="4" Width="80px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ÜRÜN ADI" VisibleIndex="5" Width="270px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MİKTAR-KG" Caption="MİKTAR<br/>(KG)" VisibleIndex="6" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="TOPLAMMIKTAR" Caption="TOPLAM<br/>MİKTAR" VisibleIndex="7" Width="70px">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                      </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="YÜKLEME TİPİ" VisibleIndex="8" Caption="YÜKLEME<br/>TİPİ"  Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="TERMİN TARİHİ" VisibleIndex="9" Caption="TERMİN<br/>TARİHİ"  Width="80px">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="SATICI" VisibleIndex="10"  Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="ÜRETİM TARİHİ" Caption="ÜRETİM<br/>TARİHİ" VisibleIndex="11" Width="70px">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="YÜKLEME LİMANI" VisibleIndex="12" Width="120px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KARŞI LİMAN" VisibleIndex="13" Width="120px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KONTEYNER SAYISI" Caption="KONTEYNER<br/>SAYISI" VisibleIndex="14" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GÜMRÜK FİRMASI" Caption="GÜMRÜK<br/>FİRMASI" VisibleIndex="15" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="LİMAN YÜKLEME GÜNÜ" Caption="LİMAN<br/>YÜKLEME<br/>GÜNÜ" VisibleIndex="16" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="LİMANA ARAÇ SON GİRİŞ SAATİ" Caption="LİMAN<br/> ARAÇ<br/>SON<br/> GİRİŞ SAATİ" Width="85px" VisibleIndex="17">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="TESLİM TARİHİ (ÜRÜNÜN ALINACAĞI TARİH)" Caption="TESLİM <br/>TARİHİ" VisibleIndex="18" Width="80px">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="SEVK ŞEKLİ" VisibleIndex="19" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SİPARİŞ NOTU" VisibleIndex="20" Width="400px" Visible="false">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="OLUŞTURAN" VisibleIndex="21">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="OLUŞTURMA TARİHİ" Caption="OLUŞTURMA<br/>TARİHİ" Width="90px" VisibleIndex="22">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="SON DEĞİŞTİREN" VisibleIndex="23" Caption="SON<br/>DEĞİŞTİREN" Width="85px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="SON DEĞİŞİKLİK TARİHİ" Caption="SON<br/>DEĞİŞİKLİK<br/>TARİHİ" VisibleIndex="24" Width="85px">
                                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="BOOKING NO" VisibleIndex="25">
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
                 

                    </div>
            <div class="btn-group">
                
                        <%--<asp:Button ID="btnTekOnay" runat="server" Text="SATIŞ ONAYI GÖNDER" CssClass="btn btn-success" OnClick="btnTekOnay_Click"/>--%>
                  
           

       </div>
              <div class="btn-group">
           
                  <a href="AcikGemi.aspx" class="btn btn-success" style="height:40px;">YENİLE</a>
       </div>
             
              
        
 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="AdminAcikGemi"  SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
</div>
     </div>
</asp:Content>
