using System;
using System.Collections.Generic;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{
  public  class T_platform_domain: SearchBase
    {

        public int id { get; set; }

        public int platformid { get; set; }

        public string domainname { get; set; }

        public DateTime createtime { get; set; }


    }
}
