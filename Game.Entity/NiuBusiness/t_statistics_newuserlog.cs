using System;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{
  public  class T_Statistics_newuserlog: SearchBase
    {
        public int id { get; set; }
        /// <summary>
        /// 新玩家ID
        /// </summary>
        public string userid { get; set; }

        /// <summary>
        /// 游戏类型 1：牛牛
        /// </summary>
        public int gametype { get; set; }
        /// <summary>
        /// 每天新增人数在单项产品开房
        /// </summary>
        public int roomNumber { get; set; }
        /// <summary>
        /// 每天新增人数在单项产品局数
        /// </summary>
        public int roundNumber { get;set;}
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
