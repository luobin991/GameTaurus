using System;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{
    public class T_Statistics_day_report : SearchBase
    {

        public int id { get; set; }
        /// <summary>
        /// 有效人数
        /// </summary>
        public int userNumber { get; set; }
        /// <summary>
        /// 开房有效数量
        /// </summary>
        public int roomNumber { get; set; }
        /// <summary>
        /// 有效局数
        /// </summary>
        public int roundNumber { get; set; }

        /// <summary>
        /// 消耗房卡数
        /// </summary>
        public int diamondNumber { get; set; }


        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createTime { get; set; }
        /// <summary>
        /// 创建时间 Get yyyy-MM-dd
        /// </summary>
        public string time { get { return createTime.ToString("yyyy-MM-dd"); } }

    }


}
