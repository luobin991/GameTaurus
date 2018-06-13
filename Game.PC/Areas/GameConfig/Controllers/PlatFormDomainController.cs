using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Game.Entity;
using Game.Common;
using Game.Entity.NiuBusiness;
using Game.BusinessLogic.NiuBusiness;

namespace Game.PC.Areas.GameConfig.Controllers
{
    public class PlatFormDomainController : MvcControllerBase
    {

        /// <summary>
        /// 域名
        /// </summary>
        private readonly IT_platform_domain bll;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public PlatFormDomainController(IT_platform_domain _bll)
        {
            this.bll = _bll;
        }


        /// <summary>
        /// 页面
        /// </summary>
        /// <returns></returns>
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
        public ActionResult GetPageList(string pagination, string sdate, string edate, string keyword)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            T_platform_domain model = new T_platform_domain();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.domainname = keyword;
            if (!string.IsNullOrWhiteSpace(sdate))
            {
                model.startDate = sdate ;
            }
            if (!string.IsNullOrWhiteSpace(edate))
            {
                model.endDate = edate ;
            }

            List<T_platform_domain> list = bll.GetPageList(model);
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
        /// 新增
        /// </summary>
        /// <returns></returns>
        public  ActionResult Edit()
        {
            List<int> list = bll.GetPlatformList();
            return View(list);
        }

        /*
         接口地址：http://192.168.0.21:2200/backgroundServer/changeDomainConfig                    
        字段名      类型   是否必须   描述
        cmd         int      y       接口标识（1标识新增 2表示删除）
        id          int      N       cmd=2时传过来用于删除
        platformId  int      N       cmd=1时新增需要传 
        domainName  String   N       cmd=时新增用
        */
        [HttpPost]
        public ActionResult add(string platformId,string domainName)
        {
            var data = new
            {
                cmd = 1,
                platformId = platformId,
                domainName = domainName
            };
            string json = JSONHelper.ObjectToJSON(data);
            bool result = WebSecurityHelper.GameServerApi.ToPost_BackGroundServer_2("changeDomainConfig", json).result;
            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "域名管理", "域名新增：平台ID" + platformId + "域名：" + domainName);
            return Response(result);
        }


        [HttpPost]
        public ActionResult Delete(int id,string url)
        {
            var data = new
            {
                cmd = 2,
                id = id,
            };

            string json = JSONHelper.ObjectToJSON(data);

            bool result = WebSecurityHelper.GameServerApi.ToPost_BackGroundServer_2("changeDomainConfig", json).result;

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "域名管理", "域名删除：平台ID" + id+"  域名:"+ url);

            return Response(result);
        }





    }
}