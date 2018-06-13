using System;
using System.Text;
using System.Linq;
using System.Data;
using System.Collections.Generic;
using Dapper;
using Game.Entity.SysManage;
using Game.Common.DBHelper;
using Game.Entity.NiuBusiness;
using Game.BusinessLogic.NiuBusiness;
using Game.DataAccess.SysManage;

namespace Game.DataAccess.NiuBusiness
{
    /// <summary>
    /// 代理关系表
    /// </summary>
    public class T_Agent_RelationDAL : It_Agent_Relation
    {

        T_UserDAL userDal = new T_UserDAL();

        /// <summary>
        /// 查询代理用户
        /// </summary>
        /// <returns></returns>
        public List<AgentDatas> GetAgentPage(AgentDatas model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                //string column = "SELECT ar.*, u.nickName,inviteU.nickName as inviteUserName ,higherU.nickName as higherUName ,u.phoneNum,u.diamond,u.loginTime ";
                string column = @"SELECT ar.*,u.wxId,u.nickName,inviteU.nickName as inviteUserName ,higherU.nickName as higherUName ,u.phoneNum,u.diamond,u.loginTime ,
((SELECT SUM(changedDiamond) from  t_diamond_log WHERE updateTime  >CONCAT(CURDATE(),' 00:00:00') and userid=ar.userid  and changedType=4) -(SELECT SUM(changedDiamond) from  t_diamond_log WHERE updateTime  >CONCAT(CURDATE(),' 00:00:00')  and userid=ar.userid  and changedType=5)) as TodayClubCos,
((SELECT SUM(changedDiamond) from  t_diamond_log WHERE updateTime  >CONCAT(CURDATE(),' 00:00:00') and userid=ar.userid  and changedType=1) -(SELECT SUM(changedDiamond) from  t_diamond_log WHERE updateTime  >CONCAT(CURDATE(),' 00:00:00')  and userid=ar.userid  and changedType=3)) as TodayCos,
 (SELECT COUNT(*) from  t_user WHERE  registerTime >CONCAT(CURDATE(),' 00:00:00') and inviteCode =ar.userid) AS TodayAddUser,
(SELECT SUM(changedDiamond) from  t_diamond_log where userid=ar.userid and changedType =10 and updateTime > CONCAT(CURDATE(),' 00:00:00')) as TodayUserDiamond,
	(SELECT SUM(changedDiamond) from  t_diamond_log where userid=ar.userid and changedType =10) as UserDiamond ,
 (SELECT COUNT(*) from t_agent_relation where higherAgent=ar.userid) LowerUserCount";

                sb.Append(column);
                sb.Append(@"
                 from T_Agent_Relation ar  
                 LEFT JOIN t_user u on u.userid = ar.userid
                 LEFT JOIN t_user higherU on higherU.userid = ar.higherAgent 
                 LEFT JOIN t_user inviteU on inviteU.userid = ar.inviteUserId 
                where  1=1  ");

                if (model.higherAgent > 0)
                {
                    sb.Append("and higherAgent = @higherAgent");
                    param.Add("@higherAgent", model.higherAgent);
                }
                if (!string.IsNullOrEmpty(model.startDate))
                {
                    sb.Append(" and createTime>=@startDate ");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrEmpty(model.endDate))
                {
                    sb.Append(" and createTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }

                if (!string.IsNullOrEmpty(model.nickName))
                {
                    sb.Append(" and u.nickName like @nickName ");
                    param.Add("@nickName", "%" + model.nickName + "%");
                }

                //获取总记录数
                string sqlCount = sb.ToString().Replace(column, "select count(1) totalCount ");

                if (!string.IsNullOrWhiteSpace(model.orderBy))
                {
                    sb.Append("  order by " + model.orderBy);
                }
                else
                    sb.Append("  order by  id desc");


                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<AgentDatas>(sb.ToString(), param).ToList();
                if (list != null && list.Count() > 0)
                {
                    //总记录数列表
                    dynamic identity = conn.Query(sqlCount, param).Single();
                    list[0].totalCount = Convert.ToInt64(identity.totalCount);
                    list[0].pageIndex = model.pageIndex;
                    list[0].pageSize = model.pageSize;
                }
                return list;
            }
        }

        /// <summary>
        /// 获取单个代理关系模型数据
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public T_Agent_Relation GetAgent(int userid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                string sql = "SELECT * from T_Agent_Relation where userId=@userId";
                param.Add("@userId", userid);
                var model = conn.Query<T_Agent_Relation>(sql, param).FirstOrDefault();
                return model;
            }

        }

        /// <summary>
        /// 根据上级玩家 获取直属下级代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public List<T_Agent_Relation> GetAgentForhigherAgent(int userid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                string sql = "SELECT * from T_Agent_Relation where higherAgent=@userId";
                param.Add("@userId", userid);
                var model = conn.Query<T_Agent_Relation>(sql, param).ToList();
                return model;
            }

        }


        /// <summary>
        /// 新增代理
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        private int Insert(T_Agent_Relation model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                return conn.Execute(@"insert into T_Agent_Relation(userId,higherAgent,inviteUserId,agentUsers,createTime,updateTime)
                    VALUES (@userId,@higherAgent,@inviteUserId,@agentUsers,@createTime,@updateTime);"
                    , model);
            }
        }



        /// <summary>
        ///根据Id更新指定字段
        /// </summary>
        /// <param name="user">主键Id，更新字段值</param>
        /// <param name="attr">更新字段 数组</param>
        /// <returns></returns>
        public int Update(T_Agent_Relation user, string[] attr)
        {
            if (attr == null || attr.Length <= 0)
                return 0;
            var sb = new StringBuilder();
            sb.Append(" update T_Agent_Relation ");

            for (int i = 0; i < attr.Length; i++)
            {
                if (i == 0)
                    sb.Append(" set " + attr[i] + " = @" + attr[i]);
                else
                    sb.Append(" ," + attr[i] + "=@" + attr[i]);
            }
            sb.Append(" where userId = @userId");
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                return conn.Execute(sb.ToString(), user);
            }
        }



        /// <summary>
        /// 删除代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        private bool DelAgentForUserID(int userid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                int result = conn.Execute(@"DELETE  FROM  T_Agent_Relation where userId=@userId"
                    , new { userId = userid });
                return result > 0;
            }
        }

        /// <summary>
        /// 设置用户为代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public bool SetUserforAgent(int userid)
        {
            //获取用户信息，是否有推荐人
            T_User userModel = userDal.GetUserInfo(userid.ToString());

            if (userModel.isProxy == 1) //已经是代理
                return false;

            T_Agent_Relation model = new T_Agent_Relation();
            model.createTime = model.updateTime = DateTime.Now;
            model.userId = userid;
            model.inviteUserId = userModel.inviteCode;

            if (userModel.inviteCode != 0)//被邀请
            {
                T_User hModel = GetUpAgents(userModel.inviteCode);

                if (hModel != null && hModel.isProxy == 1)
                {
                    model.higherAgent = hModel.userId;

                    string array = "";
                    if (hModel.isProxy == 1) //上级是代理
                    {
                        T_Agent_Relation agentRelation = GetAgent(hModel.userId);
                        if (!string.IsNullOrWhiteSpace(agentRelation.agentUsers)) // 上级代理 是否有 上上级
                        {
                            string[] ID_Index_Array = agentRelation.agentUsers.Split(',');
                            if (ID_Index_Array.Length > 0)
                            {
                                int index = Convert.ToInt32(ID_Index_Array[0].Split('_')[1]);
                                array = hModel.userId.ToString() + '_' + (index + 1) + ',' + agentRelation.agentUsers;
                            }
                            model.agentUsers = array.TrimEnd(',');
                        }
                        else //无代理关系 ,将上级写入代理序列中
                        {
                            model.agentUsers = hModel.userId + "_1";
                        }
                    }

                }
            }



            if (Insert(model) > 0)
            {
                userDal.UpdateIsProxy(model.userId, true);
                return true;
            }
            else
                return false;
        }

        /// 获取上级代理数据
        /// </summary>
        /// <param name="inviteCode"></param>
        /// <returns></returns>
        private T_User GetUpAgents(int inviteCode)
        {

            T_User userModel = userDal.GetUserInfo(inviteCode.ToString());

            return userModel;
        }

        /// <summary>
        /// 取消代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public bool SetAgentForUser(int userid)
        {
            /*
             *  1.删除玩家代理的记录
             *  2.修改下级绑定到上级代理   A->B->C    ==>  A->C
             *  2.修改下级玩家 代理列表缓存模型 ->ID_index,ID_index
             *          2.1 查找 下级玩家组
             */
            T_Agent_Relation beseAgent = GetAgent(userid); //当前代理数据

            if (DelAgentForUserID(userid))
            {
                userDal.UpdateIsProxy(userid, false);
                int resultUpdate = 0;

                List<T_Agent_Relation> lowerAgentList = GetAgentForhigherAgent(userid);  //  2.1

                #region 直属下级代理模型数据更新
                foreach (var lowerAgent in lowerAgentList)  //遍历
                {
                    if (lowerAgent != null)
                    {
                        lowerAgent.higherAgent = beseAgent.higherAgent; //C代理的上级代理 绑定到 A代理  

                        if (!string.IsNullOrWhiteSpace(lowerAgent.agentUsers))
                        {
                            lowerAgent.agentUsers = ResetDataModel(lowerAgent.agentUsers, userid);

                            resultUpdate += Update(lowerAgent, new string[] { "higherAgent", "agentUsers" }); //更新直属下级玩家
                        }
                    }
                }
                #endregion
                //遍历 更新 下级代理的子代理数据模型   //  C_3,B_2,A_1  ==> C_2,A_1
                if (resultUpdate == lowerAgentList.Count)
                {
                    foreach (var lowerAgent in lowerAgentList)
                    {
                        ResetAgent(lowerAgent, userid);
                    }
                }
                return true;
            }
            return false;
        }

        /// <summary>
        /// 重置下级代理
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        private void ResetAgent(T_Agent_Relation model, int removerAgentUserID)
        {
            List<T_Agent_Relation> lowerAgentList = GetAgentForhigherAgent(model.userId);
            for (int i = 0; i < lowerAgentList.Count; i++)
            {
                lowerAgentList[i].agentUsers = ResetDataModel(lowerAgentList[i].agentUsers, removerAgentUserID);

                int result = Update(lowerAgentList[i], new string[] { "agentUsers" });
                if (result > 0)
                {
                    ResetAgent(lowerAgentList[i], removerAgentUserID);
                }
            }
        }

        /// <summary>
        /// 重置代理模型数据
        /// </summary>
        /// <param name="agentUsers"></param>
        /// <param name="removerAgentUserID">被移除的代理ID</param>
        /// <returns></returns>
        private string ResetDataModel(string agentUsers, int removerAgentUserID)
        {
            List<string> agentNewList = new List<string>();
            bool sign = true;

            string[] agentList = agentUsers.Split(',');

            for (int i = 0; i < agentList.Length; i++)
            {
                // agentList[i]  ==>  id_index
                string[] id_index = agentList[i].Split('_');

                //当代理数据模型 遇到 被移除的数据模型 不保留
                if (Convert.ToInt32(id_index[0]) == removerAgentUserID)
                {
                    sign = false; //不变动 index
                    continue; //移除
                }
                else
                {
                    //  把阶数往前减一
                    int index = Convert.ToInt32(id_index[1]) - 1;

                    // 被移除的代理之前的阶数不变
                    string newValue = sign ? id_index[0] + "_" + index : agentList[i];

                    agentNewList.Add(newValue);
                }

            }
            return string.Join(",", agentNewList.ToArray());
        }






    }


}
