using System;
using Game.Entity.Common;


namespace Game.Entity.NiuBusiness
{

    //时刻在线人数统计表
    public class T_Diamond_log : SearchBase
    {
        /// <summary>
        /// ID
        /// </summary>
        public int id { get; set; }


        /// <summary>
        /// 用户ID
        /// </summary>
        public int userId { get; set; }


        /// <summary>
        /// 微信昵称
        /// </summary>
        public string nickName { get; set; }

        /// <summary>
        /// 帐变前钻石数
        /// </summary>
        public int oldDiamond { get; set; }


        /// <summary>
        /// 帐变后钻石数
        /// </summary>
        public int newDiamond { get; set; }

        /// <summary>
        /// 帐变钻石数
        /// </summary>
        public int changedDiamond { get; set; }

        /*
         * TYPE_RECHARGE((byte)0),//充值
	TYPE_DEDUCT((byte)1),//扣除房费
	TYPE_ACTIVITY((byte)2),//活动送(绑定邀请码)
	TYPE_RETURN((byte)3),//归还玩家扣除房费 钻石增加
	TYPE_CLUB_DEDUCT((byte)4),//俱乐部钻石扣除
	TYPE_CLUB_RETURN((byte)5),//俱乐部钻石归还
	TYPE_MANUAL_RECHARGE((byte)10),//后台手工充值
	TYPE_MANUAL_DEDUCT((byte)11);//后台手工扣除
         * */
        /// <summary>
        /// 账变类型 0-充值 1-扣除<房费> 2-活动送(绑定邀请码送) 3:解散房间退回
        /// </summary>
        public int changedType { get; set; }

        public string changedTypeStr
        {
            get
            {
                 switch (changedType)
                {
                    case 10:
                        return "手工充值";
                    case 11:
                        return "手工扣除";
                    default:
                        return "其他";
                }
            }
        }

        /// <summary>
        /// 时间
        /// </summary>
        public DateTime updateTime { get; set; }


        /// <summary>
        /// 创建时间 Get yyyy-MM-dd
        /// </summary>
        public string time { get { return updateTime.ToString("yyyy-MM-dd"); } }


        /// <summary>
        /// 消耗
        /// </summary>
        public int consumption { get; set; }

        /// <summary>
        /// 充值
        /// </summary>
        public int topup { get; set; }


    }


}
