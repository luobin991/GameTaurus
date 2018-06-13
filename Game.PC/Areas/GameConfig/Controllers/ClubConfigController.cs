using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Game.Entity;
using Game.Common;
using Game.Entity.Club;
using Game.BusinessLogic.NiuBusiness;

namespace Game.PC.Areas.GameConfig.Controllers
{
    public class ClubConfigController : MvcControllerBase
    {

        /// <summary>
        /// 公告
        /// </summary>
        private readonly It_Field_config bll;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public ClubConfigController(It_Field_config _bll)
        {
            this.bll = _bll;
        }


        public ActionResult Index()
        {
            return View();
        }


        public ActionResult GetFieldConfig()
        {
            List<T_Field_config> list = this.bll.GeFieldConfigs();
            var jsonData = new
            {
                rows = list,
                total = 1,
                page = 1,
                records = list.Count
            };
            return Success(jsonData);
        }




        public ActionResult Edit(int id)
        {
            T_Field_config model = this.bll.GeFieldConfigs().Where(w => w.typeId == id).FirstOrDefault();
            if (model == null)
            {
                model = new T_Field_config();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(T_Field_config model)
        {

            //bool result= this.bll.SetFieldCofig(model);
            var data = new
            {
                typeId = model.typeId,
                entryLimit = model.entryLimit,
                bet_min = model.min_bet,
                rate = model.rate,
                isOpen = model.isOpen ? 1 : 0
            };

            string json = JSONHelper.ObjectToJSON(data);

            bool result = WebSecurityHelper.GameServerApi.ToPost("updateFieldConfig", json).result;

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "公告俱乐部场次配置", "参数：" + model.typeId + "," + model.entryLimit + "," + model.min_bet + "," + model.rate + "," + model.isOpen);


            return Response(result);
        }

    }
}