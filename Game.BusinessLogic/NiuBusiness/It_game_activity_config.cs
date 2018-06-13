using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 时刻在线人数统计表
    /// </summary>
    public interface It_game_activity_config
    {

        /// <summary>
        /// 获取配置数据
        /// </summary>
        /// <returns></returns>
        IEnumerable<T_Game_activity_config> GetGameConfigList();


        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        int UpdateActivityConfig(T_Game_activity_config con);


    }
}
