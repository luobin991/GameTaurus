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

    public class MarqueeController : MvcControllerBase
    {

        /// <summary>
        /// 跑马灯
        /// </summary>
        private readonly It_Marquee _con;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public MarqueeController(It_Marquee con)
        {
            this._con = con;
        }

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult GetMarquees()
        {
            List<T_Marquee> list = this._con.GetMarqueeList();

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
            List<T_Marquee> list = this._con.GetMarqueeList();
            T_Marquee con = list.Where(w => w.id == id).FirstOrDefault();
            return View(con);
        }

        [HttpPost]
        public ActionResult SaveData(T_Marquee model)
        {
            model.updateTime = System.DateTime.Now;
            model.content = model.content == null ? " " : model.content;
            int result = this._con.UpdateMarquee(model);

            return Response(result);
        }



    }
}