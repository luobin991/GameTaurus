using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;


namespace Game.BusinessLogic.NiuBusiness
{


    public interface It_payConfig
    {

        /// <summary>
        ///  支付配置列表
        /// </summary>
        /// <returns></returns>
        List<T_PayConfig> GetPayConfigs();

        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        int UpdatePayConfig(T_PayConfig con);
    }





}
