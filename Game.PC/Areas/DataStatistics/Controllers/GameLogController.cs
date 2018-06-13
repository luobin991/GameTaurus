using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Game.Entity;
using Game.Common;
using Game.Entity.NiuBusiness;
using Game.Entity.SysManage;
using Game.BusinessLogic.NiuBusiness;

namespace Game.PC.Areas.DataStatistics.Controllers
{
    public class GameLogController : MvcControllerBase
    {


        /// <summary>
        /// /钻石
        /// </summary>
        private readonly It_Game_Log _log;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public GameLogController(It_Game_Log log)
        {
            this._log = log;
        }


        // GET: GameLog
        [HttpGet]
        public ActionResult Index(int id)
        {
            return View(id);
        }

        /// <summary>
        /// 局数详情
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GameRootNumDetail(long rootnum)
        {
            return View(rootnum);
        }


        /// <summary>
        /// 根据用户ID，查询ID战绩
        /// </summary>
        /// <param name="pagination"></param>
        /// <param name="sdate"></param>
        /// <param name="edate"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetGameLogPage(string pagination, string sdate, string edate, string userid)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_User model = new T_User();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.userId = Convert.ToInt32(userid);

            List<T_Game_log> list = _log.GetCombinedGameLog(model);
            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,//list[0].pageIndex,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }



        /// <summary>
        /// 查询房间的记录
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetGameRoundByRoomNum(string roomnum)
        {

            List<T_Game_round_log> list = _log.GetGameRoundByRoomNum(Convert.ToInt64(roomnum));
            var jsonData = new
            {
                rows = list,
                total = 1,
                page = 1,
                records = list.Count
            };
            return Success(jsonData);
        }


    }
}