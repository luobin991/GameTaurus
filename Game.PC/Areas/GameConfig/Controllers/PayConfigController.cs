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

    public class PayConfigController : MvcControllerBase
    {

        /// <summary>
        /// 配置
        /// </summary>
        private readonly It_payConfig _con;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public PayConfigController(It_payConfig con)
        {
            this._con = con;
        }


        // GET: GameConfig/PayConfig
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult GetPayConfigs()
        {
            List<T_PayConfig> list = this._con.GetPayConfigs();

            var jsonData = new
            {
                rows = list,
                total = 1,
                page = 1,
                records = list.Count
            };
            return Success(jsonData);
        }


        public ActionResult UpdateView(int id)
        {
            List<T_PayConfig> list = this._con.GetPayConfigs();
            T_PayConfig con = list.Where(w => w.id == id).FirstOrDefault();
            return View(con);
        }

        [HttpPost]
        public ActionResult SaveData(T_PayConfig model)
        {
            model.updateTime = System.DateTime.Now;
            int result = this._con.UpdatePayConfig(model);

            return Response(result);
        }



    }
}