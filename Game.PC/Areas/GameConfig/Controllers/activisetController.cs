using System;
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

    public class ActivisetController : MvcControllerBase
    {

        /// <summary>
        /// 游戏配置
        /// </summary>
        private readonly It_game_activity_config _con;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public ActivisetController(It_game_activity_config con)
        {
            this._con = con;
        }


        /// <summary>
        /// 配置列表页面
        /// </summary>
        /// <returns></returns>
        // GET: GameConfig/activiset
        [HttpGet]
        [WriteLog(StructDictCode.分类.访问)]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取所有配置
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetNiuNConfigList()
        {
            List<T_Game_activity_config> list = this._con.GetGameConfigList().ToList();

            var jsonData = new
            {
                rows = list,
                total = 1,
                page = 50,
                records = list.Count
            };
            return Success(jsonData);
        }

        /// <summary>
        /// 编辑配置
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Form()
        {
            return View();
        }

        /// <summary>
        /// 保存配置
        /// </summary>
        /// <param name="keyValue">主键值</param>
        /// <param name="entity">实体对象</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AjaxOnly]
        public ActionResult SaveForm(string keyValue, T_Game_activity_config entity)
        {

            bool result = _con.UpdateActivityConfig(entity) > 0;
            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(OperationType.Submit, result ? "1" : "0", "活动配置", "KEY：" + keyValue);
            return result ? Success("操作成功。") : Fail("操作失败。");
        }



    }
}