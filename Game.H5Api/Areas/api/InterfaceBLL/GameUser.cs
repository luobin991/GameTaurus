using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.BusinessLogic.Api;
using Game.DataAccess.Api;
using Newtonsoft.Json.Linq;
using System.Linq;
using Game.Entity.NiuBusiness;

namespace Game.Api.Areas.api.InterfaceBLL
{

    //下级用户 绑码玩家
    public class GameUser
    {

        #region 初始化
        /// <summary>
        /// 俱乐部
        /// </summary>
        private readonly I_GameUser _user;
        /// <summary>
        /// 构造函数
        /// </summary>
        public GameUser()
        {
            if (_user == null)
                this._user = new GameUserDAL();
        }

        private static GameUser current { get; set; }
        /// <summary>
        /// 当前凭据
        /// </summary>
        public static GameUser Current
        {
            get
            {
                if (current == null)
                    current = new GameUser();

                return current;
            }
        }

        #endregion
        
        /// <summary>
        /// 个人购买记录
        /// </summary>
        /// <param name="json"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public _Response GetMyBuyDiamond(string json, int userid)
        {
            JObject obj = JObject.Parse(json);
            _Response result = new _Response();

            int pageIndex = Convert.ToInt32(obj["pageIndex"]);
            int pageSize = Convert.ToInt32(obj["pageSize"]);

            List<T_Diamond_log> dias = this._user.GetUserDiamond(pageIndex, pageSize, "", "", userid.ToString(), "0,10"); // 1:消费扣除
            if (dias.Count == 0)
            {
                result.code = 0;
                result.msg = "无记录";
            }
            else
            {
                result.code = 1;
                result.body = dias;
                result.totalCount = (int)(dias.Count == 0 ? 0 : dias[0].totalCount);
            }
            return result;
        }






    }


}