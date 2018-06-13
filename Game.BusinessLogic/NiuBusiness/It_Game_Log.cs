using Game.Entity.SysManage;
using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 游戏战绩
    /// </summary>
    public interface It_Game_Log
    {
        /// <summary>
        /// 查询 个人游戏战绩记录
        /// </summary>
        /// <returns></returns>
        List<T_Game_log> GetCombinedGameLog(T_User model);

        /// <summary>
        /// 查询房间的记录
        /// </summary>
        /// <returns></returns>
        List<T_Game_round_log> GetGameRoundByRoomNum(long roomNum);
    }
}
