using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Game.Common;
using Game.Entity.Common;
namespace Game.Api.WebSecurityHelper
{
    public class GameServerApi
    {


        public static ResponseRet ToPost(string apiName, string json)
        {
            string url = Config.GetValue("BackGroundServer");


            string resultData = WebCommon.APIPostBack(url + "/"+ apiName, json, false);

            ResponseRet ret_data = JSONHelper.JSONToObject<Entity.Common.ResponseRet>(resultData);

            return ret_data;

        }




    }



}