using System;
using System.Collections.Generic;
using Game.Entity.NiuBusiness;
using System.Data;
using Game.Common.DBHelper;
using Dapper;
using Game.BusinessLogic.NiuBusiness;
using Game.Entity.SysManage;
using System.Text;
using System.Linq;

namespace Game.DataAccess.NiuBusiness
{
    public class T_Game_LogDAL: It_Game_Log
    {

        /// <summary>
        /// 查询 个人游戏战绩记录
        /// </summary>
        /// <returns></returns>
        public List<T_Game_log> GetCombinedGameLog(T_User model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("select * from t_game_log where (playerId1 =@userid or playerId2 =@userid or playerId3 =@userid or playerId4 =@userid or playerId5 =@userid or playerId6 =@userid )");
                if(!string.IsNullOrEmpty(model.startDate))
                {
                    sb.Append(" and updateTime>=@startDate ");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrEmpty(model.endDate))
                {
                    sb.Append(" and updateTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }
                param.Add("@userid", model.userId);
                
                sb.Append("  order by updateTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("select * ", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Game_log>(sb.ToString(), param).ToList();
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
        /// 查询房间的记录
        /// </summary>
        /// <returns></returns>
        public List<T_Game_round_log> GetGameRoundByRoomNum(long roomNum)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(@"select g.*,u1.nickName playNickName1,u2.nickName playNickName2,u3.nickName playNickName3,u4.nickName playNickName4,u5.nickName playNickName5,u6.nickName playNickName6 from t_game_round_log  g
LEFT JOIN t_user u1 on g.player1=u1.userid
LEFT JOIN t_user u2 on g.player2=u2.userid
LEFT JOIN t_user u3 on g.player3=u3.userid
LEFT JOIN t_user u4 on g.player4=u4.userid
LEFT JOIN t_user u5 on g.player5=u5.userid
LEFT JOIN t_user u6 on g.player6=u6.userid
where roomNum =@roomNum  order by updateTime desc");
                param.Add("@roomNum", roomNum);

                //分页记录列表
                var list = conn.Query<T_Game_round_log>(sb.ToString(), param).ToList();
    
                return list;
            }
        }




    }


}
