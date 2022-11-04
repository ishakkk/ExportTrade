using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExternalTrade.Classes.LOGO
{
    public class Fiches
    {
        //public static void UpdateOrders(string TeklifNo, string ambarno, string fabrika)
        //{
        //    int logicalref = 0;
        //    string doviztipi = "";

        //    double[] toplamdovizlifiyat = new double[1];
        //    double parite = 0;
        //    toplamdovizlifiyat[0] = 0;
        //    DbLogoConnection logo = new DbLogoConnection();
        //    SqlCommand dolarcek = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(1,GETDATE())", logo.LogoConnection());
        //    SqlCommand eurocek = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(20,GETDATE())", logo.LogoConnection());
        //    parite = Convert.ToDouble(eurocek.ExecuteScalar()) / Convert.ToDouble(dolarcek.ExecuteScalar());
        //    string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        //    if (Global.UnityApp.LoggedIn == true)
        //    {
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("select SiparisNo from Orders where TeklifNo='" + TeklifNo + "' group by SiparisNo", con);
        //            SqlDataAdapter da = new SqlDataAdapter();
        //            da.SelectCommand = cmd;
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            foreach (DataRow dr in dt.Rows)
        //            {
        //                string sipno = dr["SiparisNo"].ToString();
        //                SqlCommand idcek = new SqlCommand("select LOGICALREF from LG_219_01_ORFICHE where FICHENO='" + dr["SiparisNo"].ToString() + "'", logo.LogoConnection());
        //                logicalref = Convert.ToInt32(idcek.ExecuteScalar());
        //                UnityObjects.Data order = Global.UnityApp.NewDataObject(UnityObjects.DataObjectType.doSalesOrderSlip);

        //                if (order.Read(logicalref))
        //                {
        //                    UnityObjects.Lines orderline = order.DataFields.FieldByName("TRANSACTIONS").Lines;
        //                    SqlCommand cmd2 = new SqlCommand("select CONVERT(DATE,GETDATE(),104) as GUNUNTARIHI,'ÖNERİ' as SİPARİŞKODU, 'YD-'+ ''+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(u.SurName,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as YetkiKodu,o.MusteriKodu,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(o.Vade),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Vade,o.TeklifTipi,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(UPPER(u.Name),1,1),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C')+'.'+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(u.SurName),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Satici,CurrencyUnit from Orders o left outer join Users u on o.TemsilciKullaniciAdi=u.Id where o.TeklifNo='" + TeklifNo + "' group by MusteriKodu,u.SurName,o.Vade,o.TeklifTipi,u.Name,o.CurrencyUnit", con);
        //                    SqlDataAdapter da2 = new SqlDataAdapter();
        //                    da2.SelectCommand = cmd2;
        //                    DataTable dt2 = new DataTable();
        //                    da2.Fill(dt2);
        //                    foreach (DataRow row in dt2.Rows)
        //                    {

        //                        order.DataFields.FieldByName("AUXIL_CODE").Value = row["SİPARİŞKODU"].ToString();
        //                        order.DataFields.FieldByName("AUTH_CODE").Value = row["YetkiKodu"].ToString();
        //                        HttpContext.Current.Session["YetkiKodu"] = row["YetkiKodu"].ToString();
        //                        order.DataFields.FieldByName("ARP_CODE").Value = row["MusteriKodu"].ToString();
        //                        order.DataFields.FieldByName("GL_CODE").Value = row["MusteriKodu"].ToString();
        //                        order.DataFields.FieldByName("OHP_CODE").Value = ambarno;
        //                        order.DataFields.FieldByName("SOURCE_WH").Value = 1;
        //                        order.DataFields.FieldByName("SOURCE_COST_GRP").Value = 1;
        //                        if (row["CurrencyUnit"].ToString() == "$")
        //                        {
        //                            doviztipi = "$";
        //                            order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                            HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                            order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 1;
        //                        }
        //                        else if (row["CurrencyUnit"].ToString() == "€")
        //                        {
        //                            doviztipi = "€";

        //                            HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(eurocek.ExecuteScalar());
        //                            order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 2;

        //                        }
        //                        order.DataFields.FieldByName("PAYMENT_CODE").Value = row["Vade"].ToString();
        //                        order.DataFields.FieldByName("PRINT_DATE").Value = Convert.ToDateTime(row["GUNUNTARIHI"]);
        //                        order.DataFields.FieldByName("ORDER_STATUS").Value = 1;
        //                        order.DataFields.FieldByName("SALESMAN_CODE").Value = row["Satici"].ToString();
        //                        HttpContext.Current.Session["Satici"] = Convert.ToString(row["Satici"]);
        //                        order.DataFields.FieldByName("SHIPMENT_TYPE").Value = Convert.ToString(row["TeklifTipi"]); // GÖNDERİM TİPİ

        //                        order.DataFields.FieldByName("CURRSEL_DETAILS").Value = 2;

        //                    }
        //                    orderline.AppendLine();
        //                    SqlCommand altbilgi = new SqlCommand("SetDataForLogo", con);
        //                    altbilgi.Parameters.AddWithValue("@kur", Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]));
        //                    altbilgi.Parameters.AddWithValue("@TeklifNo", TeklifNo);
        //                    altbilgi.Parameters.AddWithValue("@parite", parite);
        //                    altbilgi.Parameters.AddWithValue("@dovizislemi", doviztipi);
        //                    altbilgi.CommandType = CommandType.StoredProcedure;
        //                    SqlDataAdapter da3 = new SqlDataAdapter();
        //                    da3.SelectCommand = altbilgi;
        //                    DataTable dt3 = new DataTable();
        //                    da3.Fill(dt3);
        //                    foreach (DataRow row2 in dt3.Rows)
        //                    {
        //                        orderline[orderline.Count - 1].FieldByName("TYPE").Value = 0;
        //                        orderline[orderline.Count - 1].FieldByName("MASTER_CODE").Value = Convert.ToInt32(row2["YediyuzluKod"]);
        //                        orderline[orderline.Count - 1].FieldByName("QUANTITY").Value = Convert.ToDouble(row2["MIKTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("PRICE").Value = Convert.ToDouble(row2["TLBIRIMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("VAT_BASE").Value = Convert.ToDouble(row2["TLTOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("UNIT_CODE").Value = Convert.ToString(row2["KG"]);
        //                        orderline[orderline.Count - 1].FieldByName("UNIT_CONV1").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("UNIT_CONV2").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                        orderline[orderline.Count - 1].FieldByName("CURR_PRICE").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        if (doviztipi == "$")
        //                        {
        //                            orderline[orderline.Count - 1].FieldByName("PC_PRICE").Value = Convert.ToDouble(row2["DOVIZLIBIRIMFIYAT"]);
        //                            orderline[orderline.Count - 1].FieldByName("RC_XRATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                        }
        //                        orderline[orderline.Count - 1].FieldByName("SOURCE_WH").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("SOURCE_COST_GRP").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("SALESMAN_CODE").Value = Convert.ToString(HttpContext.Current.Session["Satici"]);
        //                        orderline[orderline.Count - 1].FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        orderline[orderline.Count - 1].FieldByName("MULTI_ADD_TAX").Value = 0;
        //                        orderline[orderline.Count - 1].FieldByName("AFFECT_RISK").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_PRICE").Value = Convert.ToDouble(row2["DOVIZLIBIRIMFIYAT"]);
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_TOTAL").Value = Convert.ToDouble(row2["DOVIZLITOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_VAT_MATRAH").Value = 3325; Convert.ToDouble(row2["DOVIZLITOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_LINE_NET").Value = 3325; Convert.ToDouble(row2["DOVIZLITOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("EDT_PRICE").Value = Convert.ToDouble(row2["DOVIZLIBIRIMFIYAT"]);
        //                        orderline[orderline.Count - 1].FieldByName("EDT_CURR").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        orderline[orderline.Count - 1].FieldByName("ORG_DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                        orderline[orderline.Count - 1].FieldByName("ORG_QUANTITY").Value = Convert.ToDouble(row2["MIKTAR"]); //MİKTAR KG
        //                        orderline[orderline.Count - 1].FieldByName("ORG_PRICE").Value = Convert.ToDouble(row2["TLBIRIMTUTAR"]);
        //                        order.DataFields.FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        order.DataFields.FieldByName("TC_RATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                        order.DataFields.FieldByName("AFFECT_RISK").Value = 1;
        //                        orderline.AppendLine();
        //                        orderline.DeleteLine(1);
        //                    }

        //                    if (order.Post() == true)
        //                    {

        //                    }
        //                    else
        //                    {
        //                        if (order.ErrorCode != 0)
        //                        {
        //                            string hata = order.ErrorCode.ToString() + "-" + order.ErrorDesc + order.DBErrorDesc;


        //                            SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + hata + "' where TeklifNo='" + TeklifNo + "'", con);
        //                            update2.ExecuteNonQuery();
        //                        }
        //                        else if (order.ValidateErrors.Count > 0)
        //                        {
        //                            string result = "XML ErrorList:";
        //                            for (int i = 0; i < order.ValidateErrors.Count; i++)
        //                            {
        //                                result += "(" + order.ValidateErrors[i].ID.ToString() + ") - " + order.ValidateErrors[i].Error;
        //                            }

        //                            SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + result + "' where TeklifNo='" + TeklifNo + "'", con);
        //                            update2.ExecuteNonQuery();
        //                        }

        //                    }
        //                }
        //            }
        //            con.Close();
        //        }
        //    }


        //    else
        //    {
        //        Global.UnityApp.Login("mr", "1244244", 219);
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("select SiparisNo from Orders where TeklifNo='" + TeklifNo + "' group by SiparisNo", con);
        //            SqlDataAdapter da = new SqlDataAdapter();
        //            da.SelectCommand = cmd;
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            foreach (DataRow dr in dt.Rows)
        //            {
        //                string sipno = dr["SiparisNo"].ToString();
        //                SqlCommand idcek = new SqlCommand("select LOGICALREF from LG_219_01_ORFICHE where FICHENO='" + dr["SiparisNo"].ToString() + "'", logo.LogoConnection());
        //                logicalref = Convert.ToInt32(idcek.ExecuteScalar());
        //                UnityObjects.Data order = Global.UnityApp.NewDataObject(UnityObjects.DataObjectType.doSalesOrderSlip);

        //                if (order.Read(logicalref))
        //                {
        //                    UnityObjects.Lines orderline = order.DataFields.FieldByName("TRANSACTIONS").Lines;
        //                    SqlCommand cmd2 = new SqlCommand("select CONVERT(DATE,GETDATE(),104) as GUNUNTARIHI,'ÖNERİ' as SİPARİŞKODU, 'YD-'+ ''+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(u.SurName,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as YetkiKodu,o.MusteriKodu,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(o.Vade),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Vade,o.TeklifTipi,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(UPPER(u.Name),1,1),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C')+'.'+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(u.SurName),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Satici,CurrencyUnit from Orders o left outer join Users u on o.TemsilciKullaniciAdi=u.Id where o.TeklifNo='" + TeklifNo + "' group by MusteriKodu,u.SurName,o.Vade,o.TeklifTipi,u.Name,o.CurrencyUnit", con);
        //                    SqlDataAdapter da2 = new SqlDataAdapter();
        //                    da2.SelectCommand = cmd2;
        //                    DataTable dt2 = new DataTable();
        //                    da2.Fill(dt2);
        //                    foreach (DataRow row in dt2.Rows)
        //                    {

        //                        order.DataFields.FieldByName("AUXIL_CODE").Value = row["SİPARİŞKODU"].ToString();
        //                        order.DataFields.FieldByName("AUTH_CODE").Value = row["YetkiKodu"].ToString();
        //                        HttpContext.Current.Session["YetkiKodu"] = row["YetkiKodu"].ToString();
        //                        order.DataFields.FieldByName("ARP_CODE").Value = row["MusteriKodu"].ToString();
        //                        order.DataFields.FieldByName("GL_CODE").Value = row["MusteriKodu"].ToString();
        //                        order.DataFields.FieldByName("OHP_CODE").Value = ambarno;
        //                        order.DataFields.FieldByName("SOURCE_WH").Value = 1;
        //                        order.DataFields.FieldByName("SOURCE_COST_GRP").Value = 1;
        //                        if (row["CurrencyUnit"].ToString() == "$")
        //                        {
        //                            doviztipi = "$";
        //                            order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                            HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                            order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 1;
        //                        }
        //                        else if (row["CurrencyUnit"].ToString() == "€")
        //                        {
        //                            doviztipi = "€";
        //                            //order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(eurocek.ExecuteScalar());
        //                            HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(eurocek.ExecuteScalar());
        //                            order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 2;

        //                        }
        //                        order.DataFields.FieldByName("PAYMENT_CODE").Value = row["Vade"].ToString();
        //                        order.DataFields.FieldByName("PRINT_DATE").Value = Convert.ToDateTime(row["GUNUNTARIHI"]);
        //                        order.DataFields.FieldByName("ORDER_STATUS").Value = 1;
        //                        order.DataFields.FieldByName("SALESMAN_CODE").Value = row["Satici"].ToString();
        //                        HttpContext.Current.Session["Satici"] = Convert.ToString(row["Satici"]);
        //                        order.DataFields.FieldByName("SHIPMENT_TYPE").Value = Convert.ToString(row["TeklifTipi"]); // GÖNDERİM TİPİ

        //                        order.DataFields.FieldByName("CURRSEL_DETAILS").Value = 2;

        //                    }
        //                    orderline.AppendLine();
        //                    SqlCommand altbilgi = new SqlCommand("SetDataForLogo", con);
        //                    altbilgi.Parameters.AddWithValue("@kur", Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]));
        //                    altbilgi.Parameters.AddWithValue("@TeklifNo", TeklifNo);
        //                    altbilgi.Parameters.AddWithValue("@parite", parite);
        //                    altbilgi.Parameters.AddWithValue("@dovizislemi", doviztipi);
        //                    altbilgi.CommandType = CommandType.StoredProcedure;
        //                    SqlDataAdapter da3 = new SqlDataAdapter();
        //                    da3.SelectCommand = altbilgi;
        //                    DataTable dt3 = new DataTable();
        //                    da3.Fill(dt3);
        //                    foreach (DataRow row2 in dt3.Rows)
        //                    {
        //                        orderline[orderline.Count - 1].FieldByName("TYPE").Value = 0;
        //                        orderline[orderline.Count - 1].FieldByName("MASTER_CODE").Value = Convert.ToInt32(row2["YediyuzluKod"]);
        //                        orderline[orderline.Count - 1].FieldByName("QUANTITY").Value = Convert.ToDouble(row2["MIKTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("PRICE").Value = Convert.ToDouble(row2["TLBIRIMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("VAT_BASE").Value = Convert.ToDouble(row2["TLTOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("UNIT_CODE").Value = Convert.ToString(row2["KG"]);
        //                        orderline[orderline.Count - 1].FieldByName("UNIT_CONV1").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("UNIT_CONV2").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                        orderline[orderline.Count - 1].FieldByName("CURR_PRICE").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        if (doviztipi == "$")
        //                        {
        //                            orderline[orderline.Count - 1].FieldByName("PC_PRICE").Value = Convert.ToDouble(row2["DOVIZLIBIRIMFIYAT"]);
        //                            orderline[orderline.Count - 1].FieldByName("RC_XRATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                        }
        //                        orderline[orderline.Count - 1].FieldByName("SOURCE_WH").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("SOURCE_COST_GRP").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("SALESMAN_CODE").Value = Convert.ToString(HttpContext.Current.Session["Satici"]);
        //                        orderline[orderline.Count - 1].FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        orderline[orderline.Count - 1].FieldByName("MULTI_ADD_TAX").Value = 0;
        //                        orderline[orderline.Count - 1].FieldByName("AFFECT_RISK").Value = 1;
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_PRICE").Value = Convert.ToDouble(row2["DOVIZLIBIRIMFIYAT"]);
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_TOTAL").Value = Convert.ToDouble(row2["DOVIZLITOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_VAT_MATRAH").Value = 3325; Convert.ToDouble(row2["DOVIZLITOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("EXCLINE_LINE_NET").Value = 3325; Convert.ToDouble(row2["DOVIZLITOPLAMTUTAR"]);
        //                        orderline[orderline.Count - 1].FieldByName("EDT_PRICE").Value = Convert.ToDouble(row2["DOVIZLIBIRIMFIYAT"]);
        //                        orderline[orderline.Count - 1].FieldByName("EDT_CURR").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        orderline[orderline.Count - 1].FieldByName("ORG_DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                        orderline[orderline.Count - 1].FieldByName("ORG_QUANTITY").Value = Convert.ToDouble(row2["MIKTAR"]); //MİKTAR KG
        //                        orderline[orderline.Count - 1].FieldByName("ORG_PRICE").Value = Convert.ToDouble(row2["TLBIRIMTUTAR"]);
        //                        order.DataFields.FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row2["DOVIZTURU"]);
        //                        order.DataFields.FieldByName("TC_RATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                        order.DataFields.FieldByName("AFFECT_RISK").Value = 1;
        //                        orderline.AppendLine();
        //                        orderline.DeleteLine(1);
        //                    }

        //                    if (order.Post() == true)
        //                    {

        //                    }
        //                    else
        //                    {
        //                        if (order.ErrorCode != 0)
        //                        {
        //                            string hata = order.ErrorCode.ToString() + "-" + order.ErrorDesc + order.DBErrorDesc;


        //                            SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + hata + "' where TeklifNo='" + TeklifNo + "'", con);
        //                            update2.ExecuteNonQuery();
        //                        }
        //                        else if (order.ValidateErrors.Count > 0)
        //                        {
        //                            string result = "XML ErrorList:";
        //                            for (int i = 0; i < order.ValidateErrors.Count; i++)
        //                            {
        //                                result += "(" + order.ValidateErrors[i].ID.ToString() + ") - " + order.ValidateErrors[i].Error;
        //                            }

        //                            SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + result + "' where TeklifNo='" + TeklifNo + "'", con);
        //                            update2.ExecuteNonQuery();
        //                        }

        //                    }
        //                }
        //            }
        //            con.Close();
        //        }
        //    }
        //}












        //public static void Orders(string teklifno, string ambarno, string fabrika)
        //{
        //    string doviztipi = "";
        //    double[] toplamdovizlifiyat = new double[1];
        //    double parite = 0;
        //    toplamdovizlifiyat[0] = 0;
        //    DbLogoConnection logo = new DbLogoConnection();
        //    SqlCommand dolarcek = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(1,GETDATE())", logo.LogoConnection());
        //    SqlCommand eurocek = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(20,GETDATE())", logo.LogoConnection());
        //    parite = Convert.ToDouble(eurocek.ExecuteScalar()) / Convert.ToDouble(dolarcek.ExecuteScalar());
        //    string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        //    if (Global.UnityApp.LoggedIn == true)
        //    {
        //        UnityObjects.Data order = Global.UnityApp.NewDataObject(UnityObjects.DataObjectType.doSalesOrderSlip);

        //        order.New();
        //        UnityObjects.Lines transactions_lines = order.DataFields.FieldByName("TRANSACTIONS").Lines;
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand dovizlifiyatcek = new SqlCommand("select  SUM(buUrununSiparisTonaji)*KalemSatisFiyati as DovizliFiyat   from Orders where TeklifNo='" + teklifno + "' group by Urun,KalemSatisFiyati", con);
        //            SqlDataReader dovizlifiyatoku = dovizlifiyatcek.ExecuteReader();
        //            while (dovizlifiyatoku.Read())
        //            {
        //                toplamdovizlifiyat[0] = toplamdovizlifiyat[0] + Convert.ToDouble(dovizlifiyatoku["DovizliFiyat"]);
        //            }
        //            dovizlifiyatoku.Close();
        //            SqlCommand cmd = new SqlCommand("select CONVERT(DATE,GETDATE(),104) as GUNUNTARIHI,'ÖNERİ' as SİPARİŞKODU, 'YD-'+ ''+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(u.SurName,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as YetkiKodu,o.MusteriKodu,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(o.Vade),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Vade,o.TeklifTipi,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(UPPER(u.Name),1,1),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C')+'.'+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(u.SurName),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Satici,CurrencyUnit from Orders o left outer join Users u on o.TemsilciKullaniciAdi=u.Id where o.TeklifNo='" + teklifno + "' group by MusteriKodu,u.SurName,o.Vade,o.TeklifTipi,u.Name,o.CurrencyUnit", con);
        //            SqlDataAdapter da = new SqlDataAdapter();
        //            da.SelectCommand = cmd;
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            foreach (DataRow dr in dt.Rows)
        //            {
        //                order.DataFields.FieldByName("NUMBER").Value = "~";
        //                order.DataFields.FieldByName("DATE").Value = Convert.ToDateTime(dr["GUNUNTARIHI"]);
        //                order.DataFields.FieldByName("TIME").Value = DateTime.Now.ToShortTimeString();
        //                order.DataFields.FieldByName("AUXIL_CODE").Value = dr["SİPARİŞKODU"].ToString();
        //                order.DataFields.FieldByName("AUTH_CODE").Value = dr["YetkiKodu"].ToString();
        //                HttpContext.Current.Session["YetkiKodu"] = dr["YetkiKodu"].ToString();
        //                order.DataFields.FieldByName("ARP_CODE").Value = dr["MusteriKodu"].ToString();
        //                order.DataFields.FieldByName("GL_CODE").Value = dr["MusteriKodu"].ToString();
        //                order.DataFields.FieldByName("OHP_CODE").Value = ambarno;
        //                order.DataFields.FieldByName("SOURCE_WH").Value = 1;
        //                order.DataFields.FieldByName("SOURCE_COST_GRP").Value = 1;
        //                if (dr["CurrencyUnit"].ToString() == "$")
        //                {
        //                    doviztipi = "$";
        //                    order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                    HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                    order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 1;
        //                }
        //                else if (dr["CurrencyUnit"].ToString() == "€")
        //                {
        //                    doviztipi = "€";
        //                    //order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(eurocek.ExecuteScalar());
        //                    HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(eurocek.ExecuteScalar());
        //                    order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 2;

        //                }
        //                order.DataFields.FieldByName("PAYMENT_CODE").Value = dr["Vade"].ToString();
        //                order.DataFields.FieldByName("PRINT_DATE").Value = Convert.ToDateTime(dr["GUNUNTARIHI"]);
        //                order.DataFields.FieldByName("ORDER_STATUS").Value = 1;
        //                order.DataFields.FieldByName("SALESMAN_CODE").Value = dr["Satici"].ToString();
        //                HttpContext.Current.Session["Satici"] = Convert.ToString(dr["Satici"]);
        //                order.DataFields.FieldByName("SHIPMENT_TYPE").Value = Convert.ToString(dr["TeklifTipi"]); // GÖNDERİM TİPİ
        //                order.DataFields.FieldByName("CURRSEL_DETAILS").Value = 2;

        //                transactions_lines.AppendLine();
        //            }
        //            double kur = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //            SqlCommand altbilgi = new SqlCommand("SetDataForLogo", con);
        //            altbilgi.Parameters.AddWithValue("@kur", Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]));
        //            altbilgi.Parameters.AddWithValue("@TeklifNo", teklifno);
        //            altbilgi.Parameters.AddWithValue("@parite", parite);
        //            altbilgi.Parameters.AddWithValue("@dovizislemi", doviztipi);
        //            altbilgi.CommandType = CommandType.StoredProcedure;
        //            SqlDataAdapter da2 = new SqlDataAdapter();
        //            da2.SelectCommand = altbilgi;
        //            DataTable dt2 = new DataTable();
        //            da2.Fill(dt2);
        //            foreach (DataRow row in dt2.Rows)
        //            {
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("TYPE").Value = 0;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("MASTER_CODE").Value = Convert.ToInt32(row["YediyuzluKod"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("QUANTITY").Value = Convert.ToDouble(row["MIKTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("PRICE").Value = Convert.ToDouble(row["TLBIRIMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("VAT_BASE").Value = Convert.ToDouble(row["TLTOPLAMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("UNIT_CODE").Value = Convert.ToString(row["KG"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("UNIT_CONV1").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("UNIT_CONV2").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("CURR_PRICE").Value = Convert.ToInt32(row["DOVIZTURU"]);
        //                if (doviztipi == "$")
        //                {
        //                    transactions_lines[transactions_lines.Count - 1].FieldByName("PC_PRICE").Value = Convert.ToDouble(row["DOVIZLIBIRIMFIYAT"]);

        //                    transactions_lines[transactions_lines.Count - 1].FieldByName("RC_XRATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                }

        //                transactions_lines[transactions_lines.Count - 1].FieldByName("SOURCE_WH").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("SOURCE_COST_GRP").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("SALESMAN_CODE").Value = Convert.ToString(HttpContext.Current.Session["Satici"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row["DOVIZTURU"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("MULTI_ADD_TAX").Value = 0;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("AFFECT_RISK").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_PRICE").Value = Convert.ToDouble(row["DOVIZLIBIRIMFIYAT"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_TOTAL").Value = Convert.ToDouble(row["DOVIZLITOPLAMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_VAT_MATRAH").Value = Convert.ToDouble(row["DOVIZLITOPLAMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_LINE_NET").Value = Convert.ToDouble(row["DOVIZLITOPLAMTUTAR"]);



        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EDT_PRICE").Value = Convert.ToDouble(row["DOVIZLIBIRIMFIYAT"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EDT_CURR").Value = Convert.ToInt32(row["DOVIZTURU"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("ORG_DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("ORG_QUANTITY").Value = Convert.ToDouble(row["MIKTAR"]); //MİKTAR KG
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("ORG_PRICE").Value = Convert.ToDouble(row["TLBIRIMTUTAR"]);
        //                order.DataFields.FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row["DOVIZTURU"]);

        //                order.DataFields.FieldByName("TC_RATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                order.DataFields.FieldByName("AFFECT_RISK").Value = 1;
        //                transactions_lines.AppendLine();
        //            }

        //            if (order.Post() == true)
        //            {
        //                SqlCommand cek = new SqlCommand("select TOP 1 FICHENO from LG_219_01_ORFICHE where CYPHCODE=@p1 order by LOGICALREF desc", logo.LogoConnection());
        //                cek.Parameters.AddWithValue("@p1", HttpContext.Current.Session["YetkiKodu"]);//DÖN
        //                SqlCommand guncelle = new SqlCommand("update Orders set SiparisNo=@p1 where TeklifNo=@p2", con);
        //                guncelle.Parameters.AddWithValue("@p1", Convert.ToString(cek.ExecuteScalar()));
        //                guncelle.Parameters.AddWithValue("@p2", teklifno);
        //                guncelle.ExecuteNonQuery();
        //                SqlCommand update = new SqlCommand("update Orders set InsertLogo=1 where TeklifNo='" + teklifno + "'", con);
        //                update.ExecuteNonQuery();
        //                //Response.Write("OK");
        //                con.Close();
        //            }
        //            else
        //            {
        //                if (order.ErrorCode != 0)
        //                {
        //                    string hata = order.ErrorCode.ToString() + "-" + order.ErrorDesc + order.DBErrorDesc;

        //                    //Response.Write("DBError(" + order.ErrorCode.ToString() + ")-" + order.ErrorDesc + order.DBErrorDesc);
        //                    SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + hata + "' where TeklifNo='" + teklifno + "'", con);
        //                    update2.ExecuteNonQuery();
        //                }
        //                else if (order.ValidateErrors.Count > 0)
        //                {
        //                    string result = "XML ErrorList:";
        //                    for (int i = 0; i < order.ValidateErrors.Count; i++)
        //                    {
        //                        result += "(" + order.ValidateErrors[i].ID.ToString() + ") - " + order.ValidateErrors[i].Error;
        //                    }
        //                    //MessageBox.Show(result);
        //                    //Response.Write(result);
        //                    SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + result + "' where TeklifNo='" + teklifno + "'", con);
        //                    update2.ExecuteNonQuery();
        //                }

        //            }
        //            con.Close();
        //        }


        //    }
        //    else
        //    {
        //        Global.UnityApp.Login("mr", "1244244", 219);
        //        UnityObjects.Data order = Global.UnityApp.NewDataObject(UnityObjects.DataObjectType.doSalesOrderSlip);
        //        order.New();
        //        UnityObjects.Lines transactions_lines = order.DataFields.FieldByName("TRANSACTIONS").Lines;
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand dovizlifiyatcek = new SqlCommand("select  SUM(buUrununSiparisTonaji)*KalemSatisFiyati as DovizliFiyat   from Orders where TeklifNo='" + teklifno + "' group by Urun,KalemSatisFiyati", con);
        //            SqlDataReader dovizlifiyatoku = dovizlifiyatcek.ExecuteReader();
        //            while (dovizlifiyatoku.Read())
        //            {
        //                toplamdovizlifiyat[0] = toplamdovizlifiyat[0] + Convert.ToDouble(dovizlifiyatoku["DovizliFiyat"]);
        //            }
        //            dovizlifiyatoku.Close();
        //            SqlCommand cmd = new SqlCommand("select CONVERT(DATE,GETDATE(),104) as GUNUNTARIHI,'ÖNERİ' as SİPARİŞKODU, 'YD-'+ ''+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(u.SurName,'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as YetkiKodu,o.MusteriKodu,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(o.Vade),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Vade,o.TeklifTipi,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(UPPER(u.Name),1,1),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C')+'.'+REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(u.SurName),'Ğ','G'),'Ü','U'),'İ','I'),'Ş','S'),'Ö','O'),'Ç','C') as Satici,CurrencyUnit from Orders o left outer join Users u on o.TemsilciKullaniciAdi=u.Id where o.TeklifNo='" + teklifno + "' group by MusteriKodu,u.SurName,o.Vade,o.TeklifTipi,u.Name,o.CurrencyUnit", con);
        //            SqlDataAdapter da = new SqlDataAdapter();
        //            da.SelectCommand = cmd;
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            foreach (DataRow dr in dt.Rows)
        //            {
        //                order.DataFields.FieldByName("NUMBER").Value = "~";
        //                order.DataFields.FieldByName("DATE").Value = Convert.ToDateTime(dr["GUNUNTARIHI"]);
        //                order.DataFields.FieldByName("TIME").Value = DateTime.Now.ToShortTimeString();
        //                order.DataFields.FieldByName("AUXIL_CODE").Value = dr["SİPARİŞKODU"].ToString();
        //                order.DataFields.FieldByName("AUTH_CODE").Value = dr["YetkiKodu"].ToString();
        //                HttpContext.Current.Session["YetkiKodu"] = dr["YetkiKodu"].ToString();
        //                order.DataFields.FieldByName("ARP_CODE").Value = dr["MusteriKodu"].ToString();
        //                order.DataFields.FieldByName("GL_CODE").Value = dr["MusteriKodu"].ToString();
        //                order.DataFields.FieldByName("OHP_CODE").Value = ambarno;
        //                order.DataFields.FieldByName("SOURCE_WH").Value = 1;
        //                order.DataFields.FieldByName("SOURCE_COST_GRP").Value = 1;
        //                if (dr["CurrencyUnit"].ToString() == "$")
        //                {
        //                    doviztipi = "$";
        //                    order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                    HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(dolarcek.ExecuteScalar());
        //                    order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 1;
        //                }
        //                else if (dr["CurrencyUnit"].ToString() == "€")
        //                {
        //                    doviztipi = "€";
        //                    //order.DataFields.FieldByName("RC_RATE").Value = Convert.ToDouble(eurocek.ExecuteScalar());
        //                    HttpContext.Current.Session["DovizKuru"] = Convert.ToDouble(eurocek.ExecuteScalar());
        //                    order.DataFields.FieldByName("CURRSEL_TOTAL").Value = 2;

        //                }
        //                order.DataFields.FieldByName("PAYMENT_CODE").Value = dr["Vade"].ToString();
        //                order.DataFields.FieldByName("PRINT_DATE").Value = Convert.ToDateTime(dr["GUNUNTARIHI"]);
        //                order.DataFields.FieldByName("ORDER_STATUS").Value = 1;
        //                order.DataFields.FieldByName("SALESMAN_CODE").Value = dr["Satici"].ToString();
        //                HttpContext.Current.Session["Satici"] = Convert.ToString(dr["Satici"]);
        //                order.DataFields.FieldByName("SHIPMENT_TYPE").Value = Convert.ToString(dr["TeklifTipi"]); // GÖNDERİM TİPİ
        //                order.DataFields.FieldByName("CURRSEL_DETAILS").Value = 2;

        //                transactions_lines.AppendLine();
        //            }
        //            double kur = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //            SqlCommand altbilgi = new SqlCommand("SetDataForLogo", con);
        //            altbilgi.Parameters.AddWithValue("@kur", Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]));
        //            altbilgi.Parameters.AddWithValue("@TeklifNo", teklifno);
        //            altbilgi.Parameters.AddWithValue("@parite", parite);
        //            altbilgi.Parameters.AddWithValue("@dovizislemi", doviztipi);
        //            altbilgi.CommandType = CommandType.StoredProcedure;
        //            SqlDataAdapter da2 = new SqlDataAdapter();
        //            da2.SelectCommand = altbilgi;
        //            DataTable dt2 = new DataTable();
        //            da2.Fill(dt2);
        //            foreach (DataRow row in dt2.Rows)
        //            {
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("TYPE").Value = 0;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("MASTER_CODE").Value = Convert.ToInt32(row["YediyuzluKod"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("QUANTITY").Value = Convert.ToDouble(row["MIKTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("PRICE").Value = Convert.ToDouble(row["TLBIRIMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("VAT_BASE").Value = Convert.ToDouble(row["TLTOPLAMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("UNIT_CODE").Value = Convert.ToString(row["KG"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("UNIT_CONV1").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("UNIT_CONV2").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("CURR_PRICE").Value = Convert.ToInt32(row["DOVIZTURU"]);
        //                if (doviztipi == "$")
        //                {
        //                    transactions_lines[transactions_lines.Count - 1].FieldByName("PC_PRICE").Value = Convert.ToDouble(row["DOVIZLIBIRIMFIYAT"]);

        //                    transactions_lines[transactions_lines.Count - 1].FieldByName("RC_XRATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                }

        //                transactions_lines[transactions_lines.Count - 1].FieldByName("SOURCE_WH").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("SOURCE_COST_GRP").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("SALESMAN_CODE").Value = Convert.ToString(HttpContext.Current.Session["Satici"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row["DOVIZTURU"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("MULTI_ADD_TAX").Value = 0;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("AFFECT_RISK").Value = 1;
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_PRICE").Value = Convert.ToDouble(row["DOVIZLIBIRIMFIYAT"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_TOTAL").Value = Convert.ToDouble(row["DOVIZLITOPLAMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_VAT_MATRAH").Value = Convert.ToDouble(row["DOVIZLITOPLAMTUTAR"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EXCLINE_LINE_NET").Value = Convert.ToDouble(row["DOVIZLITOPLAMTUTAR"]);



        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EDT_PRICE").Value = Convert.ToDouble(row["DOVIZLIBIRIMFIYAT"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("EDT_CURR").Value = Convert.ToInt32(row["DOVIZTURU"]);
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("ORG_DUE_DATE").Value = DateTime.Now.ToShortDateString();
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("ORG_QUANTITY").Value = Convert.ToDouble(row["MIKTAR"]); //MİKTAR KG
        //                transactions_lines[transactions_lines.Count - 1].FieldByName("ORG_PRICE").Value = Convert.ToDouble(row["TLBIRIMTUTAR"]);
        //                order.DataFields.FieldByName("CURR_TRANSACTIN").Value = Convert.ToInt32(row["DOVIZTURU"]);

        //                order.DataFields.FieldByName("TC_RATE").Value = Convert.ToDouble(HttpContext.Current.Session["DovizKuru"]);
        //                order.DataFields.FieldByName("AFFECT_RISK").Value = 1;
        //                transactions_lines.AppendLine();
        //            }

        //            if (order.Post() == true)
        //            {
        //                SqlCommand cek = new SqlCommand("select TOP 1 FICHENO from LG_219_01_ORFICHE where CYPHCODE=@p1 order by LOGICALREF desc", logo.LogoConnection());
        //                cek.Parameters.AddWithValue("@p1", HttpContext.Current.Session["YetkiKodu"]);//DÖN
        //                SqlCommand guncelle = new SqlCommand("update Orders set SiparisNo=@p1 where TeklifNo=@p2", con);
        //                guncelle.Parameters.AddWithValue("@p1", Convert.ToString(cek.ExecuteScalar()));
        //                guncelle.Parameters.AddWithValue("@p2", teklifno);
        //                guncelle.ExecuteNonQuery();
        //                SqlCommand update = new SqlCommand("update Orders set InsertLogo=1 where TeklifNo='" + teklifno + "'", con);
        //                update.ExecuteNonQuery();
        //                //Response.Write("OK");
        //                con.Close();
        //            }
        //            else
        //            {
        //                if (order.ErrorCode != 0)
        //                {
        //                    string hata = order.ErrorCode.ToString() + "-" + order.ErrorDesc + order.DBErrorDesc;

        //                    //Response.Write("DBError(" + order.ErrorCode.ToString() + ")-" + order.ErrorDesc + order.DBErrorDesc);
        //                    SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + hata + "' where TeklifNo='" + teklifno + "'", con);
        //                    update2.ExecuteNonQuery();
        //                }
        //                else if (order.ValidateErrors.Count > 0)
        //                {
        //                    string result = "XML ErrorList:";
        //                    for (int i = 0; i < order.ValidateErrors.Count; i++)
        //                    {
        //                        result += "(" + order.ValidateErrors[i].ID.ToString() + ") - " + order.ValidateErrors[i].Error;
        //                    }
        //                    //MessageBox.Show(result);
        //                    //Response.Write(result);
        //                    SqlCommand update2 = new SqlCommand("update LogoUstBilgiler set LogBilgisi='" + result + "' where TeklifNo='" + teklifno + "'", con);
        //                    update2.ExecuteNonQuery();
        //                }

        //            }
        //            con.Close();
        //        }

        //    }
        //}
    }
}