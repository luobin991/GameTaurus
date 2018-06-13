using System;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{
    public class T_Game_log : SearchBase
    {
        public int id { get; set; }
        public int roomNum { get; set; }
        /// <summary>
        /// 游戏过的总局数
        /// </summary>
        public int roundTotal { get; set; }
        /// <summary>
        /// 已玩局数
        /// </summary>
        public int playedRound { get; set; }
        /// <summary>
        /// 模式
        ///  Game.Entity.Enum.BankerMode
        /// </summary>
        public int bankerMode { get; set; }
        public string bankerModeString { get { return System.Enum.GetName(typeof(Enum.BankerMode), bankerMode); } }
        /// <summary>
        ///  底分：1代表1/2，2代表2/4，3代表4/8 <非通比牛牛>
        /// </summary>
        public int baseScore { get; set; }
        /// <summary>
        /// 通比牛牛的底分值
        /// </summary>
        public int allCompareBaseScore { get; set; }
        /// <summary>
        /// 房主id，AA支付时没有房主
        /// </summary>
        public int roomOwnerId { get; set; }
        /// <summary>
        ///   支付方式 0-房主支付  1-AA支付
        /// </summary>
        public int payMode { get; set; }

        #region 座位1
        /// <summary>
        /// 座位1位置的玩家Id
        /// </summary>
        public string playerId1 { get; set; }
        /// <summary>
        /// 座位1的玩家总成绩
        /// </summary>
        public int score1 { get; set; }
        /// <summary>
        /// 玩家1 的微信头像
        /// </summary>
        public string headImgUrl1 { get; set; }
        /// <summary>
        /// 玩家1 的微信名
        /// </summary>
        public string nickName1 { get; set; }

        #endregion

        #region 座位2
        /// <summary>
        /// 座位2位置的玩家Id
        /// </summary>
        public string playerId2 { get; set; }
        /// <summary>
        /// 座位2的玩家总成绩
        /// </summary>
        public int score2 { get; set; }
        /// <summary>
        /// 玩家2的微信头像
        /// </summary>
        public string headImgUrl2 { get; set; }
        /// <summary>
        /// 玩家2 的微信名
        /// </summary>
        public string nickName2 { get; set; }

        #endregion

        #region 座位3
        /// <summary>
        /// 座位3位置的玩家Id
        /// </summary>
        public string playerId3 { get; set; }
        /// <summary>
        /// 座位3的玩家总成绩
        /// </summary>
        public int score3 { get; set; }
        /// <summary>
        /// 玩家3 的微信头像
        /// </summary>
        public string headImgUrl3 { get; set; }
        /// <summary>
        /// 玩家3 的微信名
        /// </summary>
        public string nickName3 { get; set; }
        #endregion

        #region 座位4
        /// <summary>
        /// 座位4位置的玩家Id
        /// </summary>
        public string playerId4 { get; set; }
        /// <summary>
        /// 座位4的玩家总成绩
        /// </summary>
        public int score4 { get; set; }
        /// <summary>
        /// 玩家4 的微信头像
        /// </summary>
        public string headImgUrl4 { get; set; }
        /// <summary>
        /// 玩家4 的微信名
        /// </summary>
        public string nickName4 { get; set; }
        #endregion

        #region 座位5
        /// <summary>
        /// 座位5位置的玩家Id
        /// </summary>
        public string playerId5 { get; set; }
        /// <summary>
        /// 座位5的玩家总成绩
        /// </summary>
        public int score5 { get; set; }
        /// <summary>
        /// 玩家5 的微信头像
        /// </summary>
        public string headImgUrl5 { get; set; }
        /// <summary>
        /// 玩家5 的微信名
        /// </summary>
        public string nickName5 { get; set; }
        #endregion

        #region 座位6
        /// <summary>
        /// 座位6位置的玩家Id
        /// </summary>
        public string playerId6 { get; set; }
        /// <summary>
        /// 座位6的玩家总成绩
        /// </summary>
        public int score6 { get; set; }
        /// <summary>
        /// 玩家6 的微信头像
        /// </summary>
        public string headImgUrl6 { get; set; }
        /// <summary>
        /// 玩家6 的微信名
        /// </summary>
        public string nickName6 { get; set; }
        #endregion

        #region 牌局
        /// <summary>
        /// 牌局1
        /// </summary>
        public string roundIndex1 { get; set; }
        public string roundIndex2 { get; set; }
        public string roundIndex3 { get; set; }
        public string roundIndex4 { get; set; }
        public string roundIndex5 { get; set; }
        public string roundIndex6 { get; set; }
        public string roundIndex7 { get; set; }
        public string roundIndex8 { get; set; }
        public string roundIndex9 { get; set; }
        public string roundIndex10 { get; set; }
        public string roundIndex11 { get; set; }
        public string roundIndex12 { get; set; }
        public string roundIndex13 { get; set; }
        public string roundIndex14 { get; set; }
        public string roundIndex15 { get; set; }
        public string roundIndex16 { get; set; }
        public string roundIndex17 { get; set; }
        public string roundIndex18 { get; set; }
        public string roundIndex19 { get; set; }
        public string roundIndex20 { get; set; }

        #endregion

        public string createRoomType { get; set; }

        /// <summary>
        /// 游戏的最后一局记录的更新时间
        /// </summary>
        public DateTime updateTime { get; set; }
        /// <summary>
        /// 该条记录的创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        /// <summary>
        /// 俱乐部ID
        /// </summary>
        public int clubid { get; set; }

        /// <summary>
        /// 是否收过费
        /// </summary>
        public int isCharge { get; set; }

    }


}
