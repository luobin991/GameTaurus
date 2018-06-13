using System;
using Game.Entity.Common;

namespace Game.Entity.Club
{
  public   class T_game_room_log:SearchBase
    {

        public int id { get; set; }

        public int clubId { get; set; }
        /// <summary>
        /// 房间号
        /// </summary>
        public int roomNum { get; set; }
        /// <summary>
        /// 俱乐部开房玩过的总局数
        /// </summary>
        public int playedRound { get; set; }
        /// <summary>
        /// 入场最低积分
        /// </summary>
        public int scoreLimit { get; set; }
        /// <summary>
        /// 游戏时长
        /// </summary>
        public int gameTime { get; set; }
        /// <summary>
        /// 上庄模式 默认为牛牛上庄 1-牛牛上庄 2-固定庄家 3-自由抢庄 4-明牌抢庄 5-通比牛牛 6-轮庄牛牛
        /// </summary>
        public int bankerMode { get; set; }
        public string bankerModeString { get { return System.Enum.GetName(typeof(Enum.BankerMode), bankerMode); } }
        /// <summary>
        /// 底分：1代表1/2，2代表2/4，3代表4/8 <非通比牛牛>
        /// </summary>
        public int baseScore { get; set; }
        /// <summary>
        ///  通比牛牛的底分值
        /// </summary>
        public int allCompareBaseScore { get; set; }
        /// <summary>
        /// 俱乐部开房者
        /// </summary>
        public int roomOwnerId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        public string createTimeStr { get { return createTime.ToString("yy-MM-dd hh:mm"); } }

        /// <summary>
        /// 更新时间  或者游戏结束时间
        /// </summary>
        public DateTime updateTime { get; set; }
        public string updateTimeStr { get { return updateTime.ToString("yy-MM-dd hh:mm"); } }

        /// <summary>
        /// 当前局统计的消耗钻石
        /// t_club_diamond_log
        /// </summary>
        public int diamond { get; set; }

    }
}
