using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;


namespace Game.BusinessLogic.NiuBusiness
{


    public interface It_Marquee
    {

        /// <summary>
        ///  跑马灯列表
        /// </summary>
        /// <returns></returns>
        List<T_Marquee> GetMarqueeList();

        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        int UpdateMarquee(T_Marquee con);
    }





}
