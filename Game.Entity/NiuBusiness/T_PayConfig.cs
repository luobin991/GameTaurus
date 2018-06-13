using System;
using System.Collections.Generic;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{
  public  class T_PayConfig 
    {

        public int id { get; set; }

        public string payType { get; set; }

        public string payName { get; set; }

        public int minMoney { get; set; }

        public int maxMoney { get; set; }

        public int status { get; set; }

        public int sort { get; set; }

        public DateTime updateTime { get; set; }

        public DateTime createtime { get; set; }


    }
}
