using System;
using Game.Entity.Common;


namespace Game.Entity.Club
{
    /// <summary>
    /// 俱乐部成员
    /// </summary>
    public class T_Club_member : SearchBase
    {
        public int id { get; set; }

        /// <summary>
        /// 所属俱乐部Id
        /// </summary>
        public int clubId { get; set; }

        /// <summary>
        /// 俱乐部成员用户id
        /// </summary>
        public int userId { get; set; }
        /// <summary>
        /// 俱乐部成员用户
        /// </summary>
        public string userName { get; set; }

        /// <summary>
        /// 俱乐部员头像
        /// </summary>
        public string headImgUrl { get; set; }
        /// <summary>
        /// 俱乐部成员可以消耗的俱乐部钻石数量(由创建者来设置，初始值为0, 房主没有上限) 
        /// </summary>
        public int diamondLimit { get; set; }

        /// <summary>
        /// 玩家已消耗的俱乐部钻石数量
        /// </summary>
        public int costDiamond { get; set; }

        /// <summary>
        ///  职位
        ///  Game.Entity.Enum.NiuEnums.dpositionEnum
        /// </summary>
        public int position { get; set; }

        /// <summary>
        /// 记录创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        /// <summary>
        /// 记录创建时间
        /// </summary>
        public string createTimeStr { get { return createTime.ToString("yyyy-MM-dd hh:mm"); } }


        /// <summary>
        /// 玩家群成员当前积分
        /// </summary>
        public int currentScore { get; set; }


        /// <summary>
        /// 玩家兑换掉的积分
        /// </summary>
        public int costScore { get; set; }


        /// <summary>
        /// 积分额度
        /// </summary>
        public int scoreLimit { get; set; }


        /// <summary>
        /// 俱乐部金币
        /// </summary>
        public int coinLimit { get; set; }


        /// <summary>
        /// 用户表持有金币
        /// </summary>
        public int coin { get; set; }
        

    }

}
