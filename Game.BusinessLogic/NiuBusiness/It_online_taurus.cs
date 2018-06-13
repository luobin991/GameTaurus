using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 时刻在线人数统计表
    /// </summary>
    public interface It_online_taurus
    {

        /// <summary>
        /// 获取当天的数据
        /// </summary>
        /// <returns></returns>
        IEnumerable<T_Online_taurus> GetDayList(string startDate, string endDate);
        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        List<T_Online_taurus> GetPageList(T_Online_taurus model);


        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        List<T_Statistics_day_report> GetDayStatisticsPage(T_Statistics_day_report model);


    }
}
