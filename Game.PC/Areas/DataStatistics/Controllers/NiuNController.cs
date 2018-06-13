using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Game.Entity;
using Game.Common;
using Game.Entity.NiuBusiness;
using Game.BusinessLogic.NiuBusiness;

namespace Game.PC.Areas.DataStatistics.Controllers
{
    public class NiuNController : MvcControllerBase
    {

        /// <summary>
        /// 在线人数统计
        /// </summary>
        private readonly It_online_taurus _onlie;
        /// <summary>
        /// 构造函数
        /// </summary>
        public NiuNController(It_online_taurus onlie)
        {
            this._onlie = onlie;
        }



        // GET: DataStatistics/NiuN
        /// <summary>
        /// 获取在线人数
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult OnlineNum()
        {
            string startDate = DateTime.Now.ToString("yyyy-MM-dd") + " 00:00:00";
            string endDate = DateTime.Now.ToString("yyyy-MM-dd") + " 23:59:59";
            var data = _onlie.GetDayList(startDate, endDate);
            return Success(data);
        }


        /// <summary>
        /// 在线人数
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [WriteLog(StructDictCode.分类.访问)]
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 获取在线人数
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetOnlinePage(string pagination, string sdate, string edate)
        {
            if (string.IsNullOrWhiteSpace(sdate))
            {
                sdate = DateTime.Now.ToString("yyyy-MM-dd");
            }
            if (string.IsNullOrWhiteSpace(edate))
            {
                edate = DateTime.Now.ToString("yyyy-MM-dd");
            }
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_Online_taurus model = new T_Online_taurus();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate + " 00:00:00";
            model.endDate = edate + " 23:59:59";


            List<T_Online_taurus> list = _onlie.GetPageList(model);
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
        /// 每天游戏的统计
        /// 有效人数，开房人数，游戏局数，钻石消耗数
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [WriteLog(StructDictCode.分类.访问)]
        public ActionResult DayIndex()
        {
            return View();
        }



        /// <summary>
        /// 获取每天统计数据
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetDayStatisticsPage(string pagination, string sdate, string edate)
        {

            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_Statistics_day_report model = new T_Statistics_day_report();
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

            List<T_Statistics_day_report> list = _onlie.GetDayStatisticsPage(model);
            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,//list[0].pageIndex,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }




    }
}