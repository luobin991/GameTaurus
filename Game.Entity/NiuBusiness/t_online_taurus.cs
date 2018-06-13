using System;
using Game.Entity.Common;


namespace Game.Entity.NiuBusiness
{

    //时刻在线人数统计表
    public class T_Online_taurus: SearchBase
    {
        /// <summary>
        /// ID
        /// </summary>
        public int id { get; set; }

        /// <summary>
        /// 在线人数
        /// </summary>
        public int onlineCount { get; set; }

        /// <summary>
        /// 游戏类型 1:牛牛
        /// </summary>
        public int gameType { get; set; }

        /// <summary>
        /// 统计时间
        /// </summary>
        public DateTime updateTime { get; set; }



    }


}
