using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Entity.NiuBusiness
{

    /// <summary>
    /// 统计模型
    /// </summary>
    public class T_BankerMode
    {

        public int id { get; set; }

        /// <summary>
        ///   日期
        /// </summary>
        public DateTime date { get; set; }

        /// <summary>
        /// 消耗总数
        /// </summary>
        public int costSum { get; set; }

        /*  牛牛上庄 = 1,
        固定庄家 = 2,
        自由抢庄 = 3,
        明牌抢庄 = 4,
        通比牛牛 = 5,
        轮庄 = 6*/
        
        /// <summary>
        /// 牛牛上庄
        /// </summary>
        public int banker_1 { get; set; }
        /// <summary>
        /// 固定庄家
        /// </summary>
        public int banker_2 { get; set; }
        /// <summary>
        /// 自由抢庄
        /// </summary>
        public int banker_3 { get; set; }
        /// <summary>
        /// 明牌抢庄
        /// </summary>
        public int banker_4 { get; set; }
        /// <summary>
        /// 通比牛牛
        /// </summary>
        public int banker_5 { get; set; }

        /// <summary>
        /// 轮庄
        /// </summary>
        public int banker_6 { get; set; }


        /// <summary>
        /// 10局
        /// </summary>
        public int banker_10 { get; set; }



        /// <summary>
        /// 20局
        /// </summary>
        public int banker_20 { get; set; }



    }


}
