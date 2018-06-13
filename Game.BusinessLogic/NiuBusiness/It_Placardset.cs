using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 公告
    /// </summary>
    public interface IT_Notice
    {

        /// <summary>
        /// 新增公告
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        int Insert(T_Notice model);


        /// <summary>
        /// 获取公告最新的一条数据
        /// </summary>
        /// <returns></returns>
        T_Notice GetPlacardsetByDESC();



        /// <summary>
        /// 获取跑马灯的数据
        /// </summary>
        /// <returns></returns>
        List<T_Notice> GetMarqueeList();

    }

}
