using System;
using System.Web.Mvc;
using System.Collections.Generic;
using Game.Entity;
using Game.Common;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;
using Game.BusinessLogic.NiuBusiness;

namespace Game.PC.Areas.ClubModule.Controllers
{
    /// <summary>
    /// 俱乐部
    /// </summary>
    public class ClubController : MvcControllerBase
    {

        private readonly It_Club _club;
        private readonly It_Club_gamelog _clubgame;

        public ClubController(It_Club club, It_Club_gamelog clubgame)
        {
            this._club = club;
            this._clubgame = clubgame;
        }

        /// <summary>
        /// 俱乐部页面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 俱乐部成员明细
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ClubDetail(string id)
        {
            ViewBag.id = id;

            return View();
        }





        /// <summary>
        /// 俱乐部消耗详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ClubCosDetail(string id)
        {
            ViewBag.id = id;

            return View();
        }



        /// <summary>
        /// 俱乐部消息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult SendClubMsg(string id)
        {
            ViewBag.id = id;

            return View();
        }


        /// <summary>
        /// 俱乐部设置
        /// </summary>
        /// <returns></returns>
        public ActionResult SetConfig()
        {
            List<T_Club_config> list = this._club.GetClubConfig();

            ViewBag.config_1 = list.Find(w => w.configType == 10001).count;
            ViewBag.config_2 = list.Find(w => w.configType == 10002).count;
            ViewBag.config_3 = list.Find(w => w.configType == 10003).count;
            ViewBag.config_4 = list.Find(w => w.configType == 10004).count;
            ViewBag.config_5 = list.Find(w => w.configType == 10005).count;
            ViewBag.config_6 = list.Find(w => w.configType == 10006).count;
            ViewBag.config_7 = list.Find(w => w.configType == 10007).count;

            return View();
        }


        /// <summary>
        /// 根据页面查询俱乐部列表
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetClubPage(string pagination, string sdate, string edate, string keyword)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_Club model = new T_Club();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.clubName = keyword;
            model.orderBy = paginationobj.sidx + " " + paginationobj.sord;

            List<T_Club> list = this._club.GetClubPage(model);
            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }

        /// <summary>
        /// 查询俱乐部成员列表
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <param name="keyword"></param>
        /// <param name="clubid"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetClubDetailPage(string pagination, string sdate, string edate, string keyword, string clubid)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_Club_member model = new T_Club_member();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.userName = keyword;
            model.clubId = Convert.ToInt32(clubid);

            List<T_Club_member> list = this._club.GetClubUserPage(model);

            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }




        /// <summary>
        /// 修改俱乐部配置
        /// </summary>
        /// <param name="val"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetClubConfig(int val, int type)
        {

            //0成功，非0表示失败
            var data = new
            {
                configType = type,
                value = val
            };

            string json = JSONHelper.ObjectToJSON(data);

            bool result = WebSecurityHelper.GameServerApi.ToPost("setClubConfig", json).result;

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "俱乐部设置", "俱乐部设置类型" + type + "==>" + val);


            return Response(result);
        }


        /// <summary>
        /// 俱乐部成员设置额度
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ClubUser(int club, int user, int type)
        {
            /*
            
            type:
            0 俱乐部扣钻比值
            1 成员钻石消耗上线
            2 成员积分额度 

             */

            ViewBag.type = type;
            ViewBag.club = club;
            ViewBag.user = user;

            return View();
        }


        /// <summary>
        /// 私人俱乐部玩家可用额度设置
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetuUserDiamondLimit(int clubid, int userid, int value, int type)
        {
            //0成功，非0表示失败
            Entity.Common.ResponseRet result = null;
            if (type == 0)  //  0 俱乐部扣钻比值
            {
                #region 俱乐部扣钻比值
                var data = new
                {
                    clubId = clubid,
                    percent = value
                };
                string json = JSONHelper.ObjectToJSON(data);

                result = WebSecurityHelper.GameServerApi.ToPost("setClubDiamondPercent", json);

                WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result.result ? "1" : "0"), "俱乐部设置", clubid + "俱乐部扣钻比值" + value);
                #endregion
            }
            else if (type == 1) // 1 成员钻石消耗上线
            {
                #region 成员钻石消耗上线
                var data = new
                {
                    clubId = clubid,
                    userId = userid,
                    value = value
                };
                string json = JSONHelper.ObjectToJSON(data);

                result = WebSecurityHelper.GameServerApi.ToPost("addPrivateClubUserCostLimit", json);

                WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result.result ? "1" : "0"), "俱乐部设置", "俱乐部" + clubid + "的" + userid + "可用额度追加" + value);

                #endregion
            }
            else if (type == 2) // 2 成员积分额度 
            {
                #region 成员积分额度
                var data = new
                {
                    clubId = clubid,
                    userId = userid,
                    addScore = value
                };
                string json = JSONHelper.ObjectToJSON(data);

                result = WebSecurityHelper.GameServerApi.ToPost("addClubMemberScoreLimit", json);

                WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result.result ? "1" : "0"), "俱乐部设置", "俱乐部" + clubid + "的" + userid + "积分额度追加" + value);

                #endregion
            }
            else if (type == 3 || type == 4) // 增加/减少俱乐部金币池
            {
                // 3：ADD 4:Reduce
                if (type == 3)
                {
                    if (value < 0)
                        return Fail("请输入正整数");
                }
                else //  Reduce
                {
                    if (value > 0)
                        value = 0 - value;
                }
                var data = new
                {
                    clubId = clubid,
                    addCoin = value
                };
                string json = JSONHelper.ObjectToJSON(data);

                result = WebSecurityHelper.GameServerApi.ToPost("addClubCoinPool", json);

                WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result.result ? "1" : "0"), "俱乐部设置", "俱乐部" + clubid + "的" + userid + "积分额度追加" + value);

            }

            return Response(result.result);
        }




        /// <summary>
        /// 俱乐部统计钻石消耗详情
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <param name="clubid"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetClubSumDiamondPage(string pagination, string sdate, string edate, string clubid)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            sys_daysum_diamond model = new sys_daysum_diamond();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.typeId = Convert.ToInt32(clubid);

            List<sys_daysum_diamond> list = this._club.GetClubSumDiamond(model);

            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }


        #region 俱乐部战绩数据

        /// <summary>
        /// 俱乐部战绩列表
        /// </summary>
        /// <returns></returns>
        public ActionResult ClubGameList()
        {
            return View();
        }



        /// <summary>
        /// 获取俱乐部的战绩列表
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <param name="clubid"></param>
        /// <returns></returns>
        public ActionResult GetClubGameList(string pagination, string sdate, string edate, string clubid)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_game_room_log model = new T_game_room_log();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.clubId = Convert.ToInt32(clubid);

            List<T_game_room_log> list = this._clubgame.GetClubGameList(model);

            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }




        /// <summary>
        /// 俱乐部战绩牌局详情
        /// </summary>
        /// <returns></returns>
        public ActionResult ClubGameDetail()
        {
            return View();
        }


        /// <summary>
        /// 获取俱乐部的战绩列表
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <param name="clubid"></param>
        /// <returns></returns>
        public ActionResult GetClubGameDetail(string pagination, string sdate, string edate, string clubid, string roomNum)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_GameRoundLogH5 model = new T_GameRoundLogH5();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.clubId = Convert.ToInt32(clubid);
            model.round = Convert.ToInt32(roomNum);

            List<T_GameRoundLogH5> list = this._clubgame.GetClubGameRoundByRoomNum(model);

            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }



        /// <summary>
        /// 俱乐部战绩玩家输赢页面
        /// </summary>
        /// <returns></returns>
        public ActionResult ClubGamePlayer()
        {
            return View();
        }


        /// <summary>
        /// 获取俱乐部的战绩列表
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <param name="clubid"></param>
        /// <returns></returns>
        public ActionResult GetClubGamePlayer(string pagination, string sdate, string edate, string clubid, string roomNum)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_game_player_log model = new T_game_player_log();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            //model.startDate = sdate;
            //model.endDate = edate;
            model.clubId = Convert.ToInt32(clubid);
            model.roomNum = Convert.ToInt32(roomNum);

            List<T_game_player_log> list = this._clubgame.GetClubGamePlayer(model);

            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }





        #endregion

    }
}