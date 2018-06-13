using System;
using Game.Entity.Excel;
using System.Collections.Generic;
using Game.Entity.NiuBusiness;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 每天新增人数在单项产品的统计
    /// </summary>
    public interface It_statistics_newuserlog
    {
        /// <summary>
        /// 获取/新增人数在单项产品的统计
        /// </summary>
        /// <returns></returns>
        List<T_Statistics_newuserlog> GetPageList(T_Statistics_newuserlog model);
    }
}
