using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;


namespace Game.BusinessLogic.NiuBusiness
{
    public interface It_Club_gamelog
    {
        /// <summary>
        /// 查询俱乐部
        /// </summary>
        /// <returns></returns>
        List<T_game_room_log> GetClubGameList(T_game_room_log model);

        /// <summary>
        /// 查询房间的记录
        /// </summary>
        /// <returns></returns>
        List<T_GameRoundLogH5> GetClubGameRoundByRoomNum(T_GameRoundLogH5 model);

        /// <summary>
        /// 查询房间的记录
        /// </summary>
        /// <returns></returns>
        List<T_game_player_log> GetClubGamePlayer(T_game_player_log model);
    }



}
