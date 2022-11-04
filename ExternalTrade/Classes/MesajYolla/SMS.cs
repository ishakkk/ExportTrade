using ExternalTrade.Properties;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace ExternalTrade.Classes.MesajYolla
{
    public class SMS
    {
        public static void SendNton(string Numara, string Mesaj)
        {
            try
            {
                WebClient webClient1 = new WebClient();
                webClient1.Headers[HttpRequestHeader.ContentType] = "application/json";
                var data1 = new
                {
                    username = Settings.Default.SMS_UserName,
                    password = Settings.Default.SMS_Password
                };
                string data2 = JsonConvert.SerializeObject((object)data1);
                string str = (string)JObject.Parse(webClient1.UploadString("https://mesajussu.turkcell.com.tr/api/api/integration/v2/login", "POST", data2))["token"];
                webClient1.Headers.Add("token", str);
                SMS.Root root = new SMS.Root()
                {
                    messages = new List<SMS.Message>(),
                    etkFlag = false
                };
                SMS.Message message = new SMS.Message()
                {
                    receiver = Numara,
                    message = Mesaj,
                    sender = Settings.Default.SMS_Sender
                };
                root.messages.Add(message);
                string data3 = JsonConvert.SerializeObject((object)root);
                WebClient webClient2 = new WebClient();
                webClient2.Headers[HttpRequestHeader.ContentType] = "application/json";
                webClient2.Headers.Add("token", str);
                webClient2.UploadString("https://mesajussu.turkcell.com.tr/api/api/integration/v2/sms/send/nton", "POST", data3);
            }
            catch (Exception ex)
            {
            }
        }

        public static void SendOton(string Numara, string Mesaj)
        {
            try
            {

                WebClient webClient1 = new WebClient();
                webClient1.Headers[HttpRequestHeader.ContentType] = "application/json";
                var data1 = new
                {
                    username = Settings.Default.SMS_UserName,
                    password = Settings.Default.SMS_Password
                };
                string data2 = JsonConvert.SerializeObject((object)data1);
                string json = webClient1.UploadString("https://mesajussu.turkcell.com.tr/api/api/integration/v2/login", "POST", data2);

                string str1 = (string)JObject.Parse(json)["token"];

                SMS.Root_ root = new SMS.Root_()
                {
                    message = Mesaj,
                    sender = Settings.Default.SMS_Sender,
                    //sender="EDEVLET",
                    etkFlag = Settings.Default.SMS_etkFlag,
                    receivers = new List<object>()
                };
                root.receivers.Add((object)Convert.ToInt64(Numara));
                string data3 = JsonConvert.SerializeObject((object)root);
                WebClient webClient2 = new WebClient();
                webClient2.Headers[HttpRequestHeader.ContentType] = "application/json";
                webClient2.Headers.Add("token", str1);

                string str2 = webClient2.UploadString("https://mesajussu.turkcell.com.tr/api/api/integration/v2/sms/send/oton", "POST", data3);

            }
            catch (Exception ex)
            {

            }
        }

        public class Message
        {
            public string receiver { get; set; }

            public string message { get; set; }

            public string sender { get; set; }
        }

        public class Root
        {
            public List<SMS.Message> messages { get; set; }

            public bool etkFlag { get; set; }
        }

        public class Root_
        {
            public string message { get; set; }

            public string sender { get; set; }

            public bool etkFlag { get; set; }

            public List<object> receivers { get; set; }
        }
    }
}