using System;
using Game.Entity.Common;

namespace Game.Entity.Club
{
    public class T_Club_diamond_log: SearchBase
    {
        /// <summary>
        /// ID
        /// </summary>
        public int id { get; set; }


        /// <summary>
        /// 用户ID
        /// </summary>
        public int clubId { get; set; }




        /// <summary>
        /// 房间号
        /// </summary>
        public int roomNum { get; set; }

        /// <summary>
        /// 用户ID
        /// </summary>
        public int userId { get; set; }




        /// <summary>
        /// 微信昵称
        /// </summary>
        public string nickName { get; set; }

        /// <summary>
        /// 钻石数
        /// </summary>
        public int diamond { get; set; }


        /// <summary>
        /// 4-消耗 5-归还
        /// </summary>
        public int type { get; set; }

        /// <summary>
        /// 说明
        /// </summary>
        public string remark { get; set; }

        public DateTime createTime { get; set; }

        public string createTimeStr { get { return createTime.ToString("yyyy-MM-dd HH:mm"); } }
    }
}
