<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ExternalTrade.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="FABRIKA" VisibleIndex="0" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SIPARIS NO" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="SIPARIS TARIHI" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="SEVK TARIHI" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="IRSALIYE NO" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MUSTERI KODU" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MUSTERI ADI" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TANIMLI VADE" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN TIPI" ReadOnly="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN ANA SINIFI" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN SINIFI" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN KODU" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN ADI" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MIKTAR" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SATIS BIRIM FIYATI" ReadOnly="True" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SATIS TON FIYATI" ReadOnly="True" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SATIS TOPLAM FIYATI" ReadOnly="True" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LISTE URUN BIRIM FIYATI" ReadOnly="True" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LISTE AMBALAJ BIRIM FIYATI" ReadOnly="True" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LISTE NAKLIYE BIRIM FIYATI" ReadOnly="True" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BIRIM VALÖR" ReadOnly="True" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LISTE BIRIM FIYATI" ReadOnly="True" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TOPLAM VALÖR" ReadOnly="True" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LISTE TOPLAM FIYATI" ReadOnly="True" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NAKLIYE GERCEKLESEN BIRIM FIYAT" ReadOnly="True" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="YURTICI/YURTDISI" ReadOnly="True" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SEVK ILI" ReadOnly="True" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SEVK ILCESI" ReadOnly="True" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SEVK ULKESI" ReadOnly="True" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SEVK NOTU" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SEKTÖR" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VADE GUNU" ReadOnly="True" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GERCEKLESEN ODEME GUNU" ReadOnly="True" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FATURA DURUMU" ReadOnly="True" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TANIMLI SATISCI" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN SATIS GRUBU" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN TASIMA TIPI" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN PAKETLEME-1" VisibleIndex="37">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN PAKETLEME-2" VisibleIndex="38">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URUN PAKETLEME MIKTARI" VisibleIndex="39">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CIRO TONAJ" ReadOnly="True" VisibleIndex="40">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogoDB_ConnectionString%>" SelectCommand="SELECT     TOP (100) PERCENT CASE STFICHE.FACTORYNR WHEN 1 THEN 'KIRIKKALE' ELSE 'MERKEZ' END AS FABRIKA, ORFICHE.FICHENO AS [SIPARIS NO], 
                      ORFICHE.DATE_ AS [SIPARIS TARIHI], STLINE.DATE_ AS [SEVK TARIHI], STFICHE.FICHENO AS [IRSALIYE NO], CLCARD.CODE AS [MUSTERI KODU], 
                      CLCARD.DEFINITION_ AS [MUSTERI ADI], PAYPLANS.CODE AS [TANIMLI VADE], 
                      CASE ITEM.CARDTYPE WHEN 1 THEN 'Ticari Mal' WHEN 2 THEN 'Karma Koli' WHEN 3 THEN 'Depozitolu Mal' WHEN 4 THEN 'Sabit Kıymet' WHEN 10 THEN 'Hammadde'
                       WHEN 11 THEN 'Yarı Mamul' WHEN 12 THEN 'Mamul' WHEN 13 THEN 'Tüketim Malı' ELSE 'Malzeme Sınıfı' END AS [URUN TIPI], 
                      SINIF.ANA_SINIF_ADI AS [URUN ANA SINIFI], SINIF.UST_SINIF_ADI AS [URUN SINIFI], ITEM.CODE AS [URUN KODU], ITEM.NAME AS [URUN ADI], 
                      STLINE.AMOUNT AS MIKTAR, ROUND(STLINE.PRICE + ISNULL(STLINE_NAK.PRICE, 0), 4) AS [SATIS BIRIM FIYATI], 
                      ROUND((STLINE.PRICE + ISNULL(STLINE_NAK.PRICE, 0)) * 1000, 2) AS [SATIS TON FIYATI], ROUND(STLINE.AMOUNT * (STLINE.PRICE + ISNULL(STLINE_NAK.PRICE, 
                      0)), 2) AS [SATIS TOPLAM FIYATI], ROUND(PRCLIST.PRICE - CONVERT(FLOAT, ISNULL(REPLACE(ITEM.SPECODE5, ',', '.'), 0)), 4) AS [LISTE URUN BIRIM FIYATI], 
                      ROUND(CONVERT(FLOAT, ISNULL(REPLACE(ITEM.SPECODE5, ',', '.'), 0)), 4) AS [LISTE AMBALAJ BIRIM FIYATI], ROUND(CONVERT(FLOAT, 
                      ISNULL(REPLACE(STLINE.SPECODE, ',', '.'), 0)), 4) AS [LISTE NAKLIYE BIRIM FIYATI], ROUND((1.5 * (CASE (LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE))) 
                      WHEN NULL THEN 0 WHEN '' THEN 0 ELSE LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE)) END) / 30) * (PRCLIST.PRICE + CONVERT(FLOAT, 
                      ISNULL(REPLACE(STLINE.SPECODE, ',', '.'), 0))) / 100, 5) AS [BIRIM VALÖR], ROUND((PRCLIST.PRICE + CONVERT(FLOAT, ISNULL(REPLACE(STLINE.SPECODE, ',', '.'), 
                      0))) * (1 + 1.5 * (CASE (LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE))) WHEN NULL THEN 0 WHEN '' THEN 0 ELSE LEFT(PAYPLANS.CODE, CHARINDEX(' ',
                       PAYPLANS.CODE)) END) / 3000), 4) AS [LISTE BIRIM FIYATI], ROUND((1.5 * (CASE (LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE))) WHEN NULL 
                      THEN 0 WHEN '' THEN 0 ELSE LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE)) END) / 30) * ((PRCLIST.PRICE + CONVERT(FLOAT, 
                      ISNULL(REPLACE(STLINE.SPECODE, ',', '.'), '0'))) * STLINE.AMOUNT) / 100, 2) AS [TOPLAM VALÖR], ROUND((PRCLIST.PRICE + CONVERT(FLOAT, 
                      ISNULL(REPLACE(STLINE.SPECODE, ',', '.'), 0))) * (1 + 1.5 * (CASE (LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE))) WHEN NULL 
                      THEN 0 WHEN '' THEN 0 ELSE LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE)) END) / 3000) * STLINE.AMOUNT, 2) AS [LISTE TOPLAM FIYATI], 
                      ROUND(CONVERT(FLOAT, ISNULL(REPLACE(STLINE.SPECODE2, ',', '.'), '0')), 4) AS [NAKLIYE GERCEKLESEN BIRIM FIYAT], CASE WHEN LEFT(CLCARD.code, 7) 
                      = '120.02.' THEN 'YURTDIŞI' ELSE 'YURTİÇİ' END AS [YURTICI/YURTDISI], UPPER(CASE LEFT(CLCARD.CODE, 7) 
                      WHEN '120.02.' THEN 'YURTDIŞI' ELSE CASE WHEN SHIPINFO.CITY IS NULL THEN CLCARD.CITY ELSE SHIPINFO.CITY END END) AS [SEVK ILI], 
                      UPPER(CASE LEFT(CLCARD.CODE, 7) WHEN '120.02.' THEN 'YURTDIŞI' ELSE CASE WHEN SHIPINFO.CITY IS NULL 
                      THEN CLCARD.TOWN ELSE SHIPINFO.TOWN END END) AS [SEVK ILCESI], UPPER(CASE LEFT(CLCARD.CODE, 7) 
                      WHEN '120.02.' THEN (CASE WHEN SHIPINFO.COUNTRY IS NULL OR
                      SHIPINFO.COUNTRY = '' THEN CLCARD.COUNTRY END) ELSE 'TÜRKİYE' END) AS [SEVK ULKESI], XT.Sevkyeri AS [SEVK NOTU], CLCARD.SPECODE2 AS SEKTÖR, 
                      CASE (LEFT(PAYPLANS.CODE, CHARINDEX(' ', PAYPLANS.CODE))) WHEN NULL THEN 0 WHEN '' THEN 0 ELSE LEFT(PAYPLANS.CODE, CHARINDEX(' ', 
                      PAYPLANS.CODE)) END AS [VADE GUNU], ODEME.GUN AS [GERCEKLESEN ODEME GUNU], 
                      CASE STLINE.BILLED WHEN 1 THEN 'FATURALANMIŞ' WHEN 0 THEN 'FATURALANMAMIŞ' END AS [FATURA DURUMU], SLSMAN.DEFINITION_ AS [TANIMLI SATISCI], 
                      ITEM.CYPHCODE AS [URUN SATIS GRUBU], ITEM.SPECODE AS [URUN TASIMA TIPI], ITEM.SPECODE2 AS [URUN PAKETLEME-1], 
                      ITEM.SPECODE3 AS [URUN PAKETLEME-2], ITEM.SPECODE4 AS [URUN PAKETLEME MIKTARI], STL.[CIRO TONAJ]
FROM         (SELECT     STOCKREF, CLIENTREF, SUM(AMOUNT) AS [CIRO TONAJ]
                       FROM          dbo.LG_219_01_STLINE
                       WHERE      (DATE_ > '2013-12-31')
                       GROUP BY STOCKREF, CLIENTREF) AS STL RIGHT OUTER JOIN
                      dbo.LG_219_01_STLINE AS STLINE ON STL.CLIENTREF = STLINE.CLIENTREF AND STL.STOCKREF = STLINE.STOCKREF LEFT OUTER JOIN
                          (SELECT     FICHEREF, CAST(SUM(VADE) / CAST(SUM(ODEMETUTARI) AS decimal(15, 4)) * - 1 AS DECIMAL(10, 0)) AS GUN, SUM(ODEMETUTARI) AS TUTAR
                            FROM          (SELECT     CASE WHEN PAYTRANS.DEVIRPROCDATE IS NULL THEN PAYTRANS.PROCDATE ELSE PAYTRANS.DEVIRPROCDATE END AS ISLEMTARIHI, 
                                                                           CASE WHEN PAYTRANS.TRCURR = 0 AND 
                                                                           PAYTRANS.TRRATE = 0 THEN PAYTRANS.PAID ELSE PAYTRANS.PAID * PAYTRANS.TRRATE END AS ODEMETUTARI, 
                                                                           PAYTRANS.DATE_ AS FATURAVADE, PAYTRANS_1.DATE_ AS ODEMETARIHI, CAST(CASE WHEN PAYTRANS.DEVIRPROCDATE IS NULL 
                                                                           THEN PAYTRANS.PROCDATE ELSE PAYTRANS.DEVIRPROCDATE END - PAYTRANS_1.DATE_ AS int) 
                                                                           * CASE WHEN PAYTRANS.TRCURR = 0 AND 
                                                                           PAYTRANS.TRRATE = 0 THEN PAYTRANS.PAID ELSE PAYTRANS.PAID * PAYTRANS.TRRATE END AS VADE, PAYTRANS.FICHEREF
                                                    FROM          dbo.LG_219_01_PAYTRANS AS PAYTRANS INNER JOIN
                                                                           dbo.LG_219_01_PAYTRANS AS PAYTRANS_1 ON PAYTRANS.CROSSREF = PAYTRANS_1.LOGICALREF
                                                    WHERE      (PAYTRANS.SIGN = 0)) AS Genel
                            GROUP BY FICHEREF) AS ODEME ON STLINE.INVOICEREF = ODEME.FICHEREF LEFT OUTER JOIN
                      dbo.LG_219_01_STLINE AS STLINE_NAK ON STLINE.STFICHEREF = STLINE_NAK.STFICHEREF AND STLINE_NAK.STOCKREF = 8920 LEFT OUTER JOIN
                      dbo.LG_219_ITEMS AS ITEM ON STLINE.STOCKREF = ITEM.LOGICALREF LEFT OUTER JOIN
                          (SELECT     LG_219_ITEMS_2.LOGICALREF, LG_219_ITEMS_2.CODE AS MAMUL_KODU, LG_219_ITEMS_2.NAME AS MAMUL_ADI, 
                                                   dbo.LG_219_ITEMS.CODE AS UST_SINIF_KODU, dbo.LG_219_ITEMS.NAME AS UST_SINIF_ADI, LG_219_ITEMS_1.CODE AS ANA_SINIF_KODU, 
                                                   LG_219_ITEMS_1.NAME AS ANA_SINIF_ADI
                            FROM          dbo.LG_219_ITEMS AS LG_219_ITEMS_1 RIGHT OUTER JOIN
                                                   dbo.LG_219_ITMCLSAS ON LG_219_ITEMS_1.LOGICALREF = dbo.LG_219_ITMCLSAS.PARENTREF RIGHT OUTER JOIN
                                                   dbo.LG_219_ITMCLSAS AS LG_219_ITMCLSAS_1 LEFT OUTER JOIN
                                                   dbo.LG_219_ITEMS ON LG_219_ITMCLSAS_1.PARENTREF = dbo.LG_219_ITEMS.LOGICALREF RIGHT OUTER JOIN
                                                   dbo.LG_219_ITEMS AS LG_219_ITEMS_2 ON LG_219_ITMCLSAS_1.CHILDREF = LG_219_ITEMS_2.LOGICALREF ON 
                                                   dbo.LG_219_ITMCLSAS.CHILDREF = LG_219_ITEMS_2.LOGICALREF
                            WHERE      (dbo.LG_219_ITMCLSAS.UPLEVEL = 1) AND (dbo.LG_219_ITMCLSAS.PARENTREF <> 1) AND (LG_219_ITMCLSAS_1.PARENTREF <> 1) AND 
                                                   (LG_219_ITMCLSAS_1.UPLEVEL = 0)) AS SINIF ON ITEM.LOGICALREF = SINIF.LOGICALREF LEFT OUTER JOIN
                      dbo.LG_219_CLCARD AS CLCARD LEFT OUTER JOIN
                      dbo.LG_219_PAYPLANS AS PAYPLANS ON CLCARD.PAYMENTREF = PAYPLANS.LOGICALREF RIGHT OUTER JOIN
                      dbo.LG_219_SHIPINFO AS SHIPINFO RIGHT OUTER JOIN
                      dbo.LG_219_01_STFICHE AS STFICHE ON SHIPINFO.LOGICALREF = STFICHE.SHIPINFOREF ON CLCARD.LOGICALREF = STFICHE.CLIENTREF LEFT OUTER JOIN
                      dbo.LG_219_SLSCLREL AS SLSCLREL LEFT OUTER JOIN
                      TIGER.dbo.LG_SLSMAN AS SLSMAN ON SLSCLREL.SALESMANREF = SLSMAN.LOGICALREF ON CLCARD.LOGICALREF = SLSCLREL.CLIENTREF ON 
                      STLINE.STFICHEREF = STFICHE.LOGICALREF LEFT OUTER JOIN
                      dbo.LG_219_01_ORFICHE AS ORFICHE ON STLINE.ORDFICHEREF = ORFICHE.LOGICALREF LEFT OUTER JOIN
                      dbo.LG_219_PRCLIST AS PRCLIST ON ITEM.LOGICALREF = PRCLIST.CARDREF AND ORFICHE.DATE_ BETWEEN PRCLIST.BEGDATE AND PRCLIST.ENDDATE AND 
                      PRCLIST.CLIENTCODE = '' LEFT OUTER JOIN
                      dbo.LG_XT1012001_219 AS XT ON ORFICHE.LOGICALREF = XT.PARLOGREF
WHERE     (STLINE.TRCODE IN (8, 9)) AND (STLINE.LINETYPE = 0) AND (STLINE.CANCELLED = 0) AND (ORFICHE.DATE_ > '2019.12.31') AND (STLINE.STOCKREF <> 8920) and STLINE.DATE_ between '2021-01-01' and '2021-12-31'
"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    </form>
    </body>
</html>
