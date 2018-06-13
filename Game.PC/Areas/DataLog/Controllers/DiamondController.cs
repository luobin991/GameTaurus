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
using Game.BusinessLogic.SysManage;

namespace Game.PC.Areas.DataLog.Controllers
{
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



        /// <summary>
        /// 钻石记录
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult DiamondLog()
        {

            return View();
        }

        /// <summary>
        /// 分页查询 
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetDiamondLogPage(string pagination, string sdate, string edate, string changedType)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_Diamond_log model = new T_Diamond_log();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;

            model.changedType = Convert.ToInt32(changedType);

            if (!string.IsNullOrWhiteSpace(sdate))
            {
                model.startDate = sdate + " 00:00:00";
            }
            if (!string.IsNullOrWhiteSpace(edate))
            {
                model.endDate = edate + " 23:59:59";
            }


            List<T_Diamond_log> list = _log.GetDiamondLogPage(model);
            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }



    }
}