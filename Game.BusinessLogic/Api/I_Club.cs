using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;

namespace Game.BusinessLogic.Api
{
    public interface I_Club
    {

        /// <summary>
        /// 俱乐部详细
        /// </summary>
        /// <param name="clubid"></param>
        /// <returns></returns>
        T_Club GetClubinfo(int clubid);


        /// <summary>
        /// 查询俱乐部
        /// </summary>
        /// <returns></returns>
        List<T_Club> GetClubPage(int userId);

        /// <summary>
        /// 查询俱乐部成员
        /// </summary>
        /// <returns></returns>
        List<T_Club_member> GetClubUser(int clubid);

        /// <summary>
        /// 查询俱乐部成员信息
        /// </summary>
        /// <returns></returns>
        T_Club_member GetClubUserInfo(int clubid, int userid);


        /// <summary>
        ///  俱乐部成员游戏记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        List<T_game_player_log> GetClubUserGamelog(int pageIndex, int pageSize, string startDate, string endDate,int clubid, int userid);


        /// <summary>
        ///  俱乐部游戏记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        List<T_game_room_log> GetClubGamelog(int clubid, int pageIndex, int pageSize, string startDate, string endDate);

        /// <summary>
        ///  俱乐部消耗钻石 房间明细
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="roomNum"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        List<T_Club_diamond_log> GetClubChargeDetail(int clubid, int roomNum, int pageIndex, int pageSize);

        /// <summary>
        ///  俱乐部成员额度消耗情况记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param> T_Club_diamond_log
        /// <returns></returns>
        List<T_Club_diamond_log> GetClubUserCosDiamondlog(int clubid, int userId, int pageIndex, int pageSize, string startDate, string endDate);


        /// <summary>
        /// 标识 俱乐部收费
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="roomNum"></param>
        /// <returns></returns>
        bool SetClubCharge(int clubid, int roomNum);

    }
}
