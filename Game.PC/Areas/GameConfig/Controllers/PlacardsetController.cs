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
    public class PlacardsetController : MvcControllerBase
    {

        /// <summary>
        /// 公告
        /// </summary>
        private readonly IT_Notice bll;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public PlacardsetController(IT_Notice _bll)
        {
            this.bll = _bll;
        }


        /// <summary>
        /// 公告页面编辑
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            T_Notice model = this.bll.GetPlacardsetByDESC();
            return View(model);
        }

        /// <summary>
        /// 提交公告内容
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddPlacard(T_Notice model)
        {
            var data = new
            {
                content = model.content == null ? "" : model.content,
                id = model.id
            };

            string json = JSONHelper.ObjectToJSON(data);

            bool result = WebSecurityHelper.GameServerApi.ToPost("updateNoticeContent", json).result;

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "公告内容设置", "大厅公告：" + model.content);

            return Response(result);
        }



        /// <summary>
        /// 跑马灯
        /// </summary>
        /// <returns></returns>
        public ActionResult Marquee()
        {
            List<T_Notice> list = this.bll.GetMarqueeList();
            return View(list);
        }


        [HttpPost]
        public ActionResult updateMarquee(int id, int status, string content)
        {
            var data = new
            {
                content = content,
                id = id,
                voild = status
            };

            string json = JSONHelper.ObjectToJSON(data);

            bool result = WebSecurityHelper.GameServerApi.ToPost("updateMarquee", json).result;

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "跑马灯修改", "跑马灯修改ID：" + id + "状态：" + status + "内容：" + content);

            return Response(result);
        }





    }
}