using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;


namespace Game.BusinessLogic.NiuBusiness
{
    public interface It_Club
    {
        /// <summary>
        /// 查询俱乐部
        /// </summary>
        /// <returns></returns>
        List<T_Club> GetClubPage(T_Club model);


        /// <summary>
        /// 查询俱乐部成员
        /// </summary>
        /// <returns></returns>
        List<T_Club_member> GetClubUserPage(T_Club_member model);

        
        
        /// <summary>
        /// 获取俱乐部配置
        /// </summary>
        /// <returns></returns>
        List<T_Club_config> GetClubConfig();




        /// <summary>
        /// 俱乐部消耗记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        List<sys_daysum_diamond> GetClubSumDiamond(sys_daysum_diamond model);
    }



}
