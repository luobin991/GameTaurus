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
    public class SectionConfigController : MvcControllerBase
    {
        /// <summary>
        /// 配置
        /// </summary>
        private readonly It_sectionConfig _con;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="user"></param>
        public SectionConfigController(It_sectionConfig con)
        {
            this._con = con;
        }


        public ActionResult Index()
        {
            List<T_SectionConfig> list = this._con.GetSectionConfigs();

            return View(list);
        }


        [HttpPost]
        public ActionResult UpdateSection(string jsonData)
        {

            int result = 0;
            if (!string.IsNullOrWhiteSpace(jsonData))
            {
                List<T_SectionConfig> list = JSONHelper.JSONStringToList<T_SectionConfig>(jsonData);
                if (list != null)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        list[i].updateTime = System.DateTime.Now;
                        if (i == 0)
                        {
                            list[i].minMoney = 0;
                        }
                        else
                        {
                            list[i].minMoney = list[i-1].maxMoney;
                        }
                        result += this._con.UpdateSectionConfig(list[i]);
                    }
                }
            }
            return Response(result);
        }




    }
}