using System;
using Game.Entity.Common;


namespace Game.Entity.NiuBusiness
{

    /// <summary>
    /// 积分俱乐部
    /// </summary>
    public class T_game_player_log : SearchBase
    {
        /// <summary>
        /// ID
        /// </summary>
        public int id { get; set; }

        public int clubId { get; set; }
        public int roomNum { get; set; }
        public int playerId { get; set; }
        public int score { get; set; }

        /// <summary>
        /// 累计买入积分
        /// </summary>
        public int buyScore { get; set; }

        /// <summary>
        /// 输赢结果
        /// </summary>
        public int result { get; set; }
        /// <summary>
        /// 是否加入游戏
        /// </summary>
        public bool isJoinGame { get; set; }

        /// <summary>
        /// 时间
        /// </summary>
        public DateTime updateTime { get; set; }

        /// <summary>
        /// 时间
        /// </summary>
        public string updateTimeStr { get { return updateTime.ToString("MM-dd HH:mm"); } }

        public string headImgUrl { get; set; }
        public string nickName { get; set; }

    }


}
