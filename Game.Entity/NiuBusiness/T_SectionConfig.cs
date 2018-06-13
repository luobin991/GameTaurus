using System;
using System.Collections.Generic;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{
  public  class T_SectionConfig
    {

        public int id { get; set; }

        /// <summary>
        /// 区间序号
        /// </summary>
        public int secType { get; set; }

        /// <summary>
        /// 最低金额 >
        /// </summary>
        public int minMoney { get; set; }

        /// <summary>
        //// 最大金额 < =
        /// </summary>
        public int maxMoney { get; set; }
        /// <summary>
        ///   比例  %
        /// </summary>
        public int scale { get; set; }

        public DateTime updateTime { get; set; }

        public DateTime createtime { get; set; }



    }
}
