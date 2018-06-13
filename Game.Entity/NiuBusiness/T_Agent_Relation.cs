using System;
using Game.Entity.Common;

namespace Game.Entity.NiuBusiness
{

    /// <summary>
    /// 代理关系
    /// </summary>
    public class T_Agent_Relation : SearchBase
    {

        public int id { get; set; }

        /// <summary>
        /// 代理用户ID,该代理的游戏ID,推荐码
        /// </summary>
        public int userId { get; set; }

        /// <summary>
        /// 邀请用户ID
        /// </summary>
        public int inviteUserId { get; set; }
        /// <summary>
        /// 上级代理
        /// </summary>
        public int higherAgent { get; set; }
        /// <summary>
        /// 上级代理列表
        /// </summary>
        public string agentUsers { get; set; }

        /// <summary>
        /// 成为代理时间
        /// </summary>
        public DateTime createTime { get; set; }

        public string createTimeStr { get { return createTime.ToString("yyyy-MM-dd hh-mm"); } }

        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime updateTime { get; set; }


        /// <summary>
        /// 1 禁用，0 正常
        /// </summary>
        public int status { get; set; }



        /// <summary>
        /// 代理玩家
        /// </summary>
        public string nickName { get; set; }


        /// <summary>
        /// 1 代理，0 邀请
        /// </summary>
        public int leve { get; set; }


    }

    /// <summary>
    /// 代理详情其他属性字段
    /// </summary>
    public class AgentDatas : T_Agent_Relation
    {

        /// <summary>
        /// 微信的Id
        /// </summary>
        public string wxId { get; set; }

        /// <summary>
        /// 邀请玩家姓名
        /// </summary>
        public string inviteUserName { get; set; }

        /// <summary>
        /// 上级玩家姓名
        /// </summary>
        public string higherUName { get; set; }


        /// <summary>
        /// 手机
        /// </summary>
        public string phoneNum { get; set; }

        /// <summary>
        /// 携带钻石
        /// </summary>
        public int diamond { get; set; }


        /// <summary>
        /// 最后登录时间
        /// </summary>
        public string loginTime { get; set; }


        /*今日消耗房卡数【分为俱乐部消耗房卡数和玩家自行创建或参与房间的房卡消耗数】*/

        /// <summary>
        /// 今日俱乐部消耗房卡数
        /// </summary>
        public int TodayClubCos { get; set; }


        /// <summary>
        /// 今日玩家自行消耗房卡数
        /// </summary>
        public int TodayCos { get; set; }

        /// <summary>
        /// 今日新增用户数
        /// </summary>
        public int TodayAddUser { get; set; }


        /// <summary>
        /// 今日用户充值金额
        /// </summary>
        public int TodayUserDiamond { get; set; }

        /// <summary>
        /// 用户充值
        /// </summary>
        public int UserDiamond { get; set; }

        /// <summary>
        /// 下级代理会员总数
        /// </summary>
        public int LowerUserCount { get; set; }

    }



}
