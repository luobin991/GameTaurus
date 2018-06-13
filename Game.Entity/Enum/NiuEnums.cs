using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Entity.Enum
{
    public class NiuEnums
    {
        public enum positionEnum
        {
            POSITION_CREATOR = 0,            //俱乐部创建者
            POSITION_ADMIN = 1,               //俱乐部管理员，预留
            POSITION_MEMBER = 2,             //俱乐部成员
            POSITION_NOT_MEMBER = 3    //非俱乐部成员 -- 申请加入俱乐部的时候会用到 ，其他时候不会用到
        }

    }

}
