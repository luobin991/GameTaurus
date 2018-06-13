using System;
using System.Web.Mvc;
using System.Collections.Generic;
using Game.Entity;
using Game.Common;
using Game.Entity.NiuBusiness;
using Game.BusinessLogic.NiuBusiness;

namespace Game.PC.Areas.DataStatistics.Controllers
{

    //钻石消耗
    public class DiamondController : MvcControllerBase
    {


        /// <summary>
        /// /钻石
        /// </summary>
        private readonly It_diamond_log _log;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public DiamondController(It_diamond_log log)
        {
            this._log = log;
        }


        // GET: DataStatistics/Diamond
        [HttpGet]
        [WriteLog(StructDictCode.分类.访问)]
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 分页查询 
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetPageList(string pagination, string sdate, string edate)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_Diamond_log model = new T_Diamond_log();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            if (!string.IsNullOrWhiteSpace(sdate))
            {
                model.startDate = sdate + " 00:00:00";
            }
            if (!string.IsNullOrWhiteSpace(edate))
            {
                model.endDate = edate + " 23:59:59";
            }


            List<T_Diamond_log> list = _log.GetPageList(model);
            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }


        /*
         *     * TYPE_RECHARGE((byte)0),//充值
	TYPE_DEDUCT((byte)1),//扣除房费
	TYPE_ACTIVITY((byte)2),//活动送(绑定邀请码)
	TYPE_RETURN((byte)3),//归还玩家扣除房费 钻石增加
	TYPE_CLUB_DEDUCT((byte)4),//俱乐部钻石扣除
	TYPE_CLUB_RETURN((byte)5),//俱乐部钻石归还
    TYPE_CLUB_RETURN((byte)6),//积分俱乐部钻石消耗
	TYPE_MANUAL_RECHARGE((byte)10),//后台手工充值
	TYPE_MANUAL_DEDUCT((byte)11);//后台手工扣除
         * */
        /// <summary>
        /// 获取在线人数
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetDiamondList()
        {

            string list = "0,10";

            var data = this._log.GetDiamondList(list);

            return Success(data);
        }

        


    }
}