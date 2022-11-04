using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Xml;

namespace ExternalTrade
{
    /// <summary>
    /// Summary description for AJAX
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class AJAX : System.Web.Services.WebService
    {

        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;
        string logo = ConfigurationManager.ConnectionStrings["LogoDB_ConnectionString"].ConnectionString;
        [WebMethod]
        public void GetContinents()
        {

            List<Continent> continents = new List<Continent>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Id,ContinentName  from Continent", con);

                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Continent continent = new Continent();
                    continent.Id = Convert.ToInt32(dr["Id"]);
                    continent.ContinetName = dr["ContinentName"].ToString();
                    continents.Add(continent);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(continents));

        }
        [WebMethod]
        public void GetDefaultContinent(int id)
        {
            List<Continent> continents = new List<Continent>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select c.ContinentName,c.Id from Orders o left outer join Continent c on o.Kita=c.ContinentName where o.Id='" + id + "'", con);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    Continent continent = new Continent();
                    continent.Id = Convert.ToInt32(dr["Id"]);
                    continent.ContinetName = dr["ContinentName"].ToString();
                    continents.Add(continent);
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(continents));
                con.Close();
            }
        }
        [WebMethod]
        public void GetOtherContinents(int id)
        {
            List<Continent> continents = new List<Continent>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select c.ContinentName,c.Id from Orders o inner join Continent c on o.Kita=c.ContinentName where c.ContinentName <> (select Kita from Orders where Id='" + id + "') group by c.ContinentName,c.Id", con);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    Continent continent = new Continent();
                    continent.Id = Convert.ToInt32(dr["Id"]);
                    continent.ContinetName = dr["ContinentName"].ToString();
                    continents.Add(continent);
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(continents));
                con.Close();
            }
        }
        [WebMethod]
        public void GetConuntryById(int UstId)
        {

            List<Country> countries = new List<Country>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Id,UstId,CountryName   from Country where UstId=@UstId", con);
                SqlParameter param = new SqlParameter()
                {
                    ParameterName = "@UstId",
                    Value = UstId
                };
                cmd.Parameters.Add(param);
                // cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Country country = new Country();
                    country.Id = Convert.ToInt32(dr["Id"]);
                    country.UstId = Convert.ToInt32(dr["UstId"]);
                    country.CountryName = dr["CountryName"].ToString();
                    countries.Add(country);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(countries));
        }
        [WebMethod]
        public void GetDefaultConuntryById(int id)
        {
            List<Country> countries = new List<Country>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select c.Id,c.CountryName  from Country c left outer join Orders o on c.CountryName=o.Ulke where o.Id='" + id + "'", con);

                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Country country = new Country();
                    country.Id = Convert.ToInt32(dr["Id"]);

                    country.CountryName = dr["CountryName"].ToString();
                    countries.Add(country);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(countries));

        }
        [WebMethod]
        public void GetOtherCountryById(int id)
        {
            List<Country> countries = new List<Country>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select country.Id,country.CountryName from Country country left outer join Continent continent on country.UstId=continent.Id left outer join Orders o on country.CountryName=o.Ulke where country.CountryName <> (select Ulke from Orders where Id='" + id + "') and continent.ContinentName=(select Kita from Orders where Id='" + id + "') group by country.Id,country.CountryName", con);

                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Country country = new Country();
                    country.Id = Convert.ToInt32(dr["Id"]);

                    country.CountryName = dr["CountryName"].ToString();
                    countries.Add(country);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(countries));
        }
        [WebMethod]
        public void GetPortsById(int UlkeId)
        {

            List<Port> ports = new List<Port>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Id,PortName,UlkeId from OtherPorts where UlkeId=@UlkeId", con);
                SqlParameter param = new SqlParameter()
                {
                    ParameterName = "@UlkeId",
                    Value = UlkeId
                };
                cmd.Parameters.Add(param);
                cmd.CommandTimeout = 1000;
                //cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Port port = new Port();
                    port.Id = Convert.ToInt32(dr["Id"]);
                    port.UlkeId = Convert.ToInt32(dr["UlkeId"]);
                    port.PortName = dr["PortName"].ToString();
                    ports.Add(port);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(ports));

        }
        [WebMethod]
        public void GetDefaultPort(int id)
        {
            List<Port> ports = new List<Port>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select op.Id,op.PortName from OtherPorts op left outer join Orders o on op.PortName=o.VarisLimani where o.Id='" + id + "'", con);

                cmd.CommandTimeout = 1000;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Port port = new Port();
                    port.Id = Convert.ToInt32(dr["Id"]);

                    port.PortName = dr["PortName"].ToString();
                    ports.Add(port);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(ports));
        }
        [WebMethod]
        public void GetOtherPortById(int id)
        {
            List<Port> ports = new List<Port>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select op.Id,op.PortName  from OtherPorts op left outer join Country c on op.UlkeId=c.Id left outer join Orders o on op.PortName=o.VarisLimani where op.PortName <> (select VarisLimani from Orders where Id='" + id + "') and c.CountryName=(select Ulke from Orders where Id='" + id + "')", con);

                cmd.CommandTimeout = 1000;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Port port = new Port();
                    port.Id = Convert.ToInt32(dr["Id"]);

                    port.PortName = dr["PortName"].ToString();
                    ports.Add(port);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(ports));
        }
        [WebMethod]
        public void GetProduct()
        {

            List<Urun> uruns = new List<Urun>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Code, ProductName from Product where Active=1", con);

                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Urun urun = new Urun();
                    urun.Code = Convert.ToString(dr["Code"]);
                    urun.ProductName = Convert.ToString(dr["ProductName"]);
                    uruns.Add(urun);

                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(uruns));

        }
        [WebMethod]
        public void GetDefaultProduct(int id)
        {
            List<Urun> uruns = new List<Urun>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select p.Id,p.ProductName from Product p left outer join Orders o on p.ProductName=o.Urun where o.Id='" + id + "' union all select p.Id,P.ProductName from Product p where p.ProductName <> (select  Urun from Orders where Id='" + id + "')", con);

                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Urun urun = new Urun();
                    urun.Id = Convert.ToInt32(dr["Id"]);
                    urun.ProductName = Convert.ToString(dr["ProductName"]);
                    uruns.Add(urun);

                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(uruns));
        }
        [WebMethod]
        public void GetDefaultProductDetails(int id)
        {
            List<UrunUzun> urunuzuns = new List<UrunUzun>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select mamul.CODE,mamul.NAME+''+[(mamul.NAME)] as NAME  from DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul left outer join Orders o on mamul.CODE=o.YediyuzluKod where o.Id=48 union all select mam.CODE,mam.NAME from DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mam where mam.UST_SINIF_ADI=(select  Urun collate SQL_Latin1_General_CP1_CI_AS from Orders where Id='" + id + "') and mam.CODE <> (select ISNULL(YediyuzluKod,'YOK') from Orders where Id='" + id + "')", con);
                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    UrunUzun urunuzun = new UrunUzun();
                    urunuzun.CODE = Convert.ToString(dr["CODE"]);
                    urunuzun.NAME = Convert.ToString(dr["NAME"]);

                    urunuzuns.Add(urunuzun);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(urunuzuns));
        }
        [WebMethod]
        public void GetProductDetailt(string NAME)
        {

            List<UrunUzun> urunuzuns = new List<UrunUzun>();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select CODE,NAME+' ('+[CODE]+')' as NAME  from DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] where UST_SINIF_KODU=@p1", con);
                cmd.Parameters.AddWithValue("@p1", NAME);
                cmd.CommandTimeout = 1000;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    UrunUzun urunuzun = new UrunUzun();
                    urunuzun.CODE = Convert.ToString(dr["CODE"]);
                    urunuzun.NAME = Convert.ToString(dr["NAME"]);

                    urunuzuns.Add(urunuzun);
                }
                dr.Close();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(urunuzuns));
        }
        [WebMethod]
        public double DovizIslemi()
        {
            double dolar;
            const string bugun = "https://www.tcmb.gov.tr/kurlar/today.xml";
            //List<Doviz> doviz = new List<Doviz>();
            //Doviz dov = new Doviz();
            using (SqlConnection con = new SqlConnection(logo))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(1,GETDATE())", con);
                dolar = Convert.ToDouble(cmd.ExecuteScalar());
                if (dolar == 0)
                {
                    var cxml = new XmlDocument();
                    cxml.Load(bugun);
                    dolar = Convert.ToDouble(cxml.SelectSingleNode("Tarih_Date/Currency [@Kod = 'USD']/BanknoteBuying").InnerXml.Replace(".", ","));
                }

            
            }
           
            return dolar;
        }
        [WebMethod]
        public void TumBildirimleriSil()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("truncate table AdminNotification",con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        [WebMethod]
        public void UserBildirimleriSil(int id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from UserNotifications where Whom='"+id+"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}
