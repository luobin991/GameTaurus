using System;
using Game.Entity.Common;
using System.ComponentModel.DataAnnotations.Schema;

namespace Game.Entity.NiuBusiness
{



    //游戏 活动配置
    public class T_Game_activity_config
    {
        /// <summary>
        /// ID
        /// </summary>
        [Column("id")]
        public int id { get; set; }

        /// <summary>
        /// 活动送钻石类型
        /// </summary>
        [Column("type")]
        public int type { get; set; }

        /// <summary>
        /// 活动送钻石类型
        /// </summary>
        public string typeName
        {
            get
            {
                if (type == 1)
                    return "推广送";
                else
                    return "";
            }
        }



        /// <summary>
        /// 玩家绑定邀请码成功后，赠送的钻石
        /// </summary>
        [Column("addDiamond")]
        public int addDiamond { get; set; }

        /// <summary>
        /// 时间
        /// </summary>
        [Column("updateTime")]
        public DateTime updateTime { get; set; }

    }


}
