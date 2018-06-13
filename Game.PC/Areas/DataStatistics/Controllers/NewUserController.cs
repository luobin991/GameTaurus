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
    public class NewUserController : MvcControllerBase
    {

        /// <summary>
        /// 玩家用户
        /// </summary>
        private readonly It_statistics_newuserlog _log;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public NewUserController(It_statistics_newuserlog log)
        {
            this._log = log;
        }


        // GET: DataStatistics/NewUser
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
            T_Statistics_newuserlog model = new T_Statistics_newuserlog();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;

            List<T_Statistics_newuserlog> list = _log.GetPageList(model);
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