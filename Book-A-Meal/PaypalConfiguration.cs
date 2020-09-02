using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal.Api;

namespace Book_A_Meal
{
    public class PaypalConfiguration
    {
        public readonly static string clientId;
        public readonly static string clientSecret;

        static PaypalConfiguration()
        {
            var config = getconfig();
            clientId = "AZ23VkuEfqhjj_PDbOeJxAjux6nL9LT5CJUmG4CXeNQJ2vMNDQ_pExZIT_dqE3KrqD97aHVIU6zWHq08";
            clientSecret = "EAYLeCSC__cqnZACMsdbEA5vUMz7zGeR3x5CZPmf1qr8xi1d3fqNjThj8Zro4q14fGjppmqL7qHphI3w";
        }

        private static Dictionary<string, string> getconfig()
        {
            return PayPal.Api.ConfigManager.Instance.GetProperties();
        }

        private static string GetAccessToken()
        {
            string accessToken = new OAuthTokenCredential(clientId, clientSecret, getconfig()).GetAccessToken();
            return accessToken;
        }

        public static APIContext GetAPIContext()
        {
            APIContext apicontext = new APIContext(GetAccessToken());
            apicontext.Config = getconfig();
            return apicontext;
        }
    }
}