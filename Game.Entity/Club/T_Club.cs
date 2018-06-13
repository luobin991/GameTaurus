using System;
using Game.Entity.Common;

namespace Game.Entity.Club
{
    public class T_Club : SearchBase
    {
        /// <summary>
        /// 表唯一索引
        /// </summary>
        public int id { get; set; }

        /// <summary>
        /// 俱乐部id
        /// </summary>
        public int clubId { get; set; }

        /// <summary>
        /// 俱乐部名称
        /// </summary>
        public string clubName { get; set; }

        /// <summary>
        /// 俱乐部图标的url
        /// </summary>
        public string iconUrl { get; set; }

        /// <summary>
        /// 俱乐部创建者的id
        /// </summary>
        public int creatorId { get; set; }
        /// <summary>
        /// 俱乐部创建者
        /// </summary>
        public string creatName { get; set; }
        /// <summary>
        /// 俱乐部创建所属城市
        /// </summary>
        public string city { get; set; }

        /// <summary>
        /// 加入俱乐部的总人数
        /// </summary>
        public int peopleCount { get; set; }

        /// <summary>
        /// 俱乐部创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        
        /// <summary>
        /// 创建时间
        /// </summary>
        public string createTimeStr { get { return createTime.ToString("yyyy-MM-dd hh:mm"); } }

        /// <summary>
        /// 俱乐部修改时间
        /// </summary>
        public DateTime modifyTime { get; set; }

        /// <summary>
        /// 俱乐部介绍
        /// </summary>
        public string clubIntroduce { get; set; }

        /// <summary>
        /// 管理俱乐部的职位
        /// </summary>
        public Entity.Enum.NiuEnums.positionEnum position { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int diamondPercent { get; set; }

        /// <summary>
        /// 创建俱乐部积分池 ，初始值1000000000
        /// </summary>
        public int scorePool { get; set; }

        /// <summary>
        /// 创建俱乐部金币池
        /// </summary>
        public int coinPool { get; set; }

        /// <summary>
        /// 小盲的伸缩倍率 底分倍率
        /// </summary>
        public int expandRate { get; set; }
        /// <summary>
        /// 最低买入底分的倍率 最小带入积分倍率
        /// </summary>
        public int scoreRate { get; set; }


        public string scorePoolStr { get { return NumToString(scorePool, false); } }

        public string coinPoolStr { get { return NumToString(coinPool, false); } }
    }


}
