using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 时刻在线人数统计表
    /// </summary>
    public interface It_diamond_log
    {

        /// <summary>
        /// 获取时间段的数据
        /// </summary>
        /// <returns></returns>
        List<T_Diamond_log> GetPageList(T_Diamond_log model);


        /// <summary>
        /// 查询当天的钻石变动列表
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        List<T_Diamond_log> GetDiamondList(string types);

        
        /// <summary>
        /// 获取冲扣 钻石 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        List<T_Diamond_log> GetDiamondLogPage(T_Diamond_log model);


    }
}
