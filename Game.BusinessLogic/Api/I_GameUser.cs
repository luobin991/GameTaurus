using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Game.Entity.NiuBusiness;

namespace Game.BusinessLogic.Api
{
    public interface I_GameUser
    {
        
        /// <summary>
        /// 获取 用户消费情况
        /// </summary>
        /// <returns></returns>
        List<T_Diamond_log> GetUserDiamond(int pageIndex, int pageSize, string startDate, string endDate, string userids, string typearr);
        

    }


}
