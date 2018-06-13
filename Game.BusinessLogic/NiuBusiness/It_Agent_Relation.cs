using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    public interface It_Agent_Relation
    {
        /// <summary>
        /// 查询代理用户
        /// </summary>
        /// <returns></returns>
        List<AgentDatas> GetAgentPage(AgentDatas model);

        /// <summary>
        /// 获取单个代理关系模型数据
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        T_Agent_Relation GetAgent(int userid);

        /// <summary>
        /// 根据上级玩家 获取直属下级代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        List<T_Agent_Relation> GetAgentForhigherAgent(int userid);

        /// <summary>
        /// 设置用户为代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        bool SetUserforAgent(int userid);

        /// <summary>
        /// 取消代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        bool SetAgentForUser(int userid);

        /// <summary>
        ///根据Id更新指定字段
        /// </summary>
        /// <param name="user">主键Id，更新字段值</param>
        /// <param name="attr">更新字段 数组</param>
        /// <returns></returns>
        int Update(T_Agent_Relation user, string[] attr);
        
        


    }


}
