using System;
using Game.Entity.Common;


namespace Game.Entity.NiuBusiness
{


    /// <summary>
    /// 
    /// </summary>
    public class sys_daysum_diamond : SearchBase
    {


        public int id { get; set; }
        /// <summary>
        /// 类别：1个人，2俱乐部
        /// </summary>
        public int type { get; set; }
        /// <summary>
        /// 对象Id
        /// </summary>
        public int typeId { get; set; }
        /// <summary>
        /// 钻石数量
        /// </summary>
        public int diamond { get; set; }
        /// <summary>
        /// 钻石类型:1消耗
        /// </summary>
        public int diamondType { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        public string createTimeStr { get{ return createTime.ToString("yyyy-MM-dd"); } }
        /// <summary>
        /// 上庄消耗钻石数
        /// </summary>
        public int playSZ { get; set; }
        /// <summary>
        /// 固定消耗钻石数
        /// </summary>
        public int playGD { get; set; }
        /// <summary>
        /// 自由消耗钻石数
        /// </summary>
        public int playZY { get; set; }

        /// <summary>
        /// 明牌消耗钻石数
        /// </summary>
        public int playMP { get; set; }
        /// <summary>
        /// 通比消耗钻石数
        /// </summary>
        public int playTB { get; set; }
        /// <summary>
        /// 轮庄消耗钻石数
        /// </summary>
        public int playLZ { get; set; }
        /// <summary>
        /// 10局消耗钻石数
        /// </summary>
        public int play10 { get; set; }

        /// <summary>
        /// 20局消耗钻石数
        /// </summary>
        public int play20 { get; set; }
    }
}
