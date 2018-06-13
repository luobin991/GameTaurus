using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.BusinessLogic.Api;
using Game.DataAccess.Api;
using Newtonsoft.Json.Linq;
using System.Linq;
using Game.Entity.NiuBusiness;
using Game.Common;

namespace Game.Api.Areas.api.InterfaceBLL
{
    public class Club
    {

        /// <summary>
        /// 俱乐部
        /// </summary>
        private readonly I_Club _club;
        /// <summary>
        /// 构造函数
        /// </summary>
        public Club()
        {
            if (_club == null)
                this._club = new ClubDAL();
        }

        private static Club current { get; set; }
        /// <summary>
        /// 当前凭据
        /// </summary>
        public static Club Current
        {
            get
            {
                if (current == null)
                    current = new Club();

                return current;
            }
        }


        /*
         * 
         * 会员管理：可查看俱乐部的会员列表，列表信息包括该会员的加入时间、在俱乐部里每日的开房和参与游戏的数量、参 与的房间号
        消耗记录：可查看自己房卡的消耗记录以及俱乐部会员每个玩家的消耗记录（该消耗也同样是消耗的俱乐部管理员的房卡）	
        收费记录:显示俱乐部里每个房间的打牌结算列表记录、房号及大赢家，并提供给代理对已经收过房费的房间做标记的功能。

         */



        /// <summary>
        /// 俱乐部的身份验证
        /// </summary>
        /// <param name="json"></param>
        /// <param name="userid"></param>
        public object GetClubAuth(string json, int userid)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);


            List<T_Club_member> list = this._club.GetClubUser(clubid);
            T_Club_member user = list.Where(w => w.userId == userid).FirstOrDefault();

            _Response result = new _Response();


            if (user == null)
            {
                result.code = 0;

                result.msg = "非俱乐部成员";
            }
            else
            {
                result.code = 1;
                result.body = new
                {
                    position = user.position
                };
                result.msg = "身份验证成功";
            }
            return result;
        }




        /// <summary>
        /// 获取俱乐部列表
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public _Response GetClubList(int userid)
        {
            List<T_Club> clubs = this._club.GetClubPage(userid);

            _Response result = new _Response(true);
            result.body = clubs;
            result.totalCount = clubs.Count;

            return result;
        }



        /// <summary>
        /// 获取俱乐部的成员
        /// </summary>
        /// <param name="club"></param>
        /// <returns></returns>
        public _Response GetClubmemberList(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);

            List<T_Club_member> list = this._club.GetClubUser(clubid);

            _Response result = new _Response(true);
            result.body = list;
            result.totalCount = list.Count;

            return result;
        }


        /// <summary>
        /// 获取俱乐部的消息
        /// </summary>
        /// <returns></returns>
        public _Response GetClubInfo(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);

            T_Club club = this._club.GetClubinfo(clubid);

            _Response result = new _Response(true);
            result.body = club;

            return result;
        }


        /// <summary>
        /// 俱乐部成员信息
        /// </summary>
        /// <param name="userid"></param>
        /// <param name="user"></param>
        /// <returns></returns>
        public _Response GetClubUserInfo(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);
            int userid = Convert.ToInt32(obj["userid"]);

            T_Club_member club = this._club.GetClubUserInfo(clubid, userid);

            _Response result = new _Response(true);
            result.body = club;

            return result;
        }



        /// <summary>
        ///  俱乐部成员游戏记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public _Response GetClubUserGamelog(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);
            int userid = Convert.ToInt32(obj["userid"]);
            int pageIndex = Convert.ToInt32(obj["pageIndex"]);
            int pageSize = Convert.ToInt32(obj["pageSize"]);
            string startDate = obj["startDate"].ToString();
            string endDate = obj["endDate"].ToString();

            List<T_game_player_log> gameList = this._club.GetClubUserGamelog(pageIndex, pageSize, startDate, endDate, clubid, userid);

            _Response result = new _Response(true);
            result.body = gameList;

            return result;
        }


        /// <summary>
        /// 俱乐部游戏记录
        /// </summary>
        /// <param name="json"></param>
        /// <returns></returns>
        public _Response GetClubGamelog(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubID"]);
            int pageIndex = Convert.ToInt32(obj["pageIndex"]);
            int pageSize = Convert.ToInt32(obj["pageSize"]);
            string startDate = obj["startDate"].ToString();
            string endDate = obj["endDate"].ToString();

            List<T_game_room_log> list = this._club.GetClubGamelog(clubid, pageIndex, pageSize, startDate, endDate);

            _Response result = new _Response();
            if (null != list && list.Count > 0)
            {
                result.code = 1;
                result.body = list;
                result.totalCount = Convert.ToInt32(list[0].totalCount);
            }
            else
            {
                result.code = 0;
                result.msg = "无数据";
            }

            return result;
        }

        /// <summary>
        /// 俱乐部耗钻记录明细
        /// </summary>
        /// <param name="json"></param>
        /// <returns></returns>
        public _Response GetClubChargeDetail(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubID"]);
            int roomNum = Convert.ToInt32(obj["roomNum"]);
            int pageIndex = Convert.ToInt32(obj["pageIndex"]);
            int pageSize = Convert.ToInt32(obj["pageSize"]);

            List<T_Club_diamond_log> list = this._club.GetClubChargeDetail(clubid, roomNum, pageIndex, pageSize);

            _Response result = new _Response();
            if (null != list && list.Count > 0)
            {
                result.code = 1;
                result.body = list;
                result.totalCount = Convert.ToInt32(list[0].totalCount);
            }
            else
            {
                result.code = 0;
                result.msg = "无数据";
            }

            return result;
        }





        /// <summary>
        /// 俱乐部游戏记录
        /// </summary>
        /// <param name="json"></param>
        /// <returns></returns>
        public _Response GetClubUserCosDiamondlog(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubID"]);
            int userid = Convert.ToInt32(obj["userid"]);
            int pageIndex = Convert.ToInt32(obj["pageIndex"]);
            int pageSize = Convert.ToInt32(obj["pageSize"]);
            string startDate = obj["startDate"].ToString();
            string endDate = obj["endDate"].ToString();

            List<T_Club_diamond_log> list = this._club.GetClubUserCosDiamondlog(clubid, userid, pageIndex, pageSize, startDate, endDate);
            //4-消耗 5-归还  6-买入底分消耗
            List<T_Club_diamond_log> listType_5 = list.Where(w => w.type == 5).ToList();
            List<T_Club_diamond_log> listType_6 = list.Where(w => w.type == 6).ToList();
            if (listType_5.Count > 0)
            {
                foreach (var item in listType_5)
                {
                    listType_6.RemoveAll(w => w.roomNum == item.roomNum);
                }
            }

            _Response result = new _Response();
            if (null != listType_6 && listType_6.Count > 0)
            {
                result.code = 1;
                result.body = listType_6.Skip(pageSize * (pageIndex - 1)).Take(pageSize).ToList();
                result.totalCount = listType_6.Count;// Convert.ToInt32(listType_6[0].totalCount);
            }
            else
            {
                result.code = 0;
                result.msg = "无数据";
            }

            return result;
        }


        /// <summary>
        /// 设置俱乐部开房收费=>已收费
        /// </summary>
        /// <param name="json"></param>
        /// <returns></returns>
        public _Response SetClubCharge(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubID"]);
            int roomNum = Convert.ToInt32(obj["roomNum"]);

            bool resultBool = this._club.SetClubCharge(clubid, roomNum);

            _Response result = new _Response(resultBool);

            return result;
        }

        /// <summary>
        /// 设置俱乐部成员 可用钻石上限
        /// </summary>
        /// <param name="josn"></param>
        /// <returns></returns>
        public _Response SetUserClubDiamondLimit(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);
            int userId = Convert.ToInt32(obj["userId"]);
            int value = Convert.ToInt32(obj["val"]);

            var data = new
            {
                clubId = clubid,
                userId = userId,
                value = value
            };
            json = JSONHelper.ObjectToJSON(data);

            Entity.Common.ResponseRet dataResult = WebSecurityHelper.GameServerApi.ToPost("addPrivateClubUserCostLimit", json);

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (dataResult.result ? "1" : "0"), "俱乐部设置", "APP 俱乐部" + clubid + "的" + userId + "可用额度追加" + value);


            _Response result = new _Response(dataResult.result);
            T_Club_member club = this._club.GetClubUserInfo(clubid, userId);
            result.body = club;
            return result;
        }


        /// <summary>
        /// 设置俱乐部成员 可用积分上限
        /// </summary>
        /// <param name="josn"></param>
        /// <returns></returns>
        public _Response AddClubMemberScoreLimit(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);
            int userid = Convert.ToInt32(obj["userId"]);
            int value = Convert.ToInt32(obj["val"]);
            var data = new
            {
                clubId = clubid,
                userId = userid,
                addScore = value
            };
            json = JSONHelper.ObjectToJSON(data);

            Entity.Common.ResponseRet dataResult = WebSecurityHelper.GameServerApi.ToPost("addClubMemberScoreLimit", json);

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (dataResult.result ? "1" : "0"), "俱乐部设置", "俱乐部" + clubid + "的" + userid + "积分额度追加" + value);

            _Response result = new _Response(dataResult.result);
            T_Club_member club = this._club.GetClubUserInfo(clubid, userid);
            result.body = club;
            return result;
        }




        /// <summary>
        /// 设置积分俱乐部底分 倍率  expandRate scoreRate
        /// </summary>
        /// <param name="json"></param>
        /// <returns></returns>
        public _Response setClubRate(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["clubId"]);
            int expandRate = Convert.ToInt32(obj["expandRate"]);
            int scoreRate = Convert.ToInt32(obj["scoreRate"]);
            var data = new
            {
                clubId = clubid,
                expandRate = expandRate,
                scoreRate = scoreRate
            };

            Entity.Common.ResponseRet dataResult = WebSecurityHelper.GameServerApi.ToPost("setClubRate", json);

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (dataResult.result ? "1" : "0"), "俱乐部设置", "俱乐部" + clubid + "的底分倍率" + expandRate + "最小带入积分倍率" + scoreRate);

            _Response result = new _Response(dataResult.result);
            return result;

        }




        /// <summary>
        /// 设置俱乐部成员 可用积分上限
        /// </summary>
        /// <param name="josn"></param>
        /// <returns></returns>
        public _Response AddClubMemberCoinLimit(string json)
        {
            JObject obj = JObject.Parse(json);

            int clubid = Convert.ToInt32(obj["nClubId"]);
            int userid = Convert.ToInt32(obj["userId"]);
            int value = Convert.ToInt32(obj["val"]);
            var data = new
            {
                clubId = clubid,
                userId = userid,
                addCoin = value
            };
            json = JSONHelper.ObjectToJSON(data);

            Entity.Common.ResponseRet dataResult = WebSecurityHelper.GameServerApi.ToPost("addClubMemberCoinLimit", json);

            #region 返回错误信息
            /*
              101             用户不存在
             206             俱乐部不存在
             210             该俱乐部成员不存在
             252             金币池余额不足
             253             回收金币时玩家余额不足
             250             积分池不足
             251             回收积分时成员的现有积分不足
              */
            string msg = "";
            switch (dataResult.ret)
            {
                case 101:
                    msg = "用户不存在";
                    break;
                case 206:
                    msg = "俱乐部不存在";
                    break;
                case 210:
                    msg = "该俱乐部成员不存在";
                    break;
                case 252:
                    msg = "金币池余额不足";
                    break;
                case 253:
                    msg = "回收金币时玩家余额不足";
                    break;
                case 250:
                    msg = "积分池不足";
                    break;
                case 251:
                    msg = "回收积分时成员的现有积分不足";
                    break;
                default:
                    break;
            }
            #endregion

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (dataResult.result ? "1" : "0"), "俱乐部设置", "请求返回状态码" + dataResult.ret + ";" + msg + ";俱乐部" + clubid + "的" + userid + "金币 请求 " + value);

            _Response result = new _Response(dataResult.result);
            result.msg = msg;
            T_Club_member club = this._club.GetClubUserInfo(clubid, userid);
            result.body = club;
            return result;
        }



    }



}