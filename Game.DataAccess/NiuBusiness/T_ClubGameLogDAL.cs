using System;
using System.Collections.Generic;
using Game.Entity.NiuBusiness;
using System.Data;
using Game.Common.DBHelper;
using Dapper;
using Game.BusinessLogic.NiuBusiness;
using Game.Entity.Club;
using System.Text;
using System.Linq;

namespace Game.DataAccess.NiuBusiness
{
    public class T_ClubGameLogDAL : It_Club_gamelog
    {

        /// <summary>
        /// 查询 个人游戏战绩记录
        /// </summary>
        /// <returns></returns>
        public List<T_game_room_log> GetClubGameList(T_game_room_log model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * FROM t_game_room_log where clubId=@clubId");

                param.Add("@clubId", model.clubId);

                if(!string.IsNullOrEmpty(model.startDate))
                {
                    sb.Append(" and createTime>=@startDate ");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrEmpty(model.endDate))
                {
                    sb.Append(" and updateTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }
                
                sb.Append("  order by id desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT *", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_game_room_log>(sb.ToString(), param).ToList();
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
        public List<T_GameRoundLogH5> GetClubGameRoundByRoomNum(T_GameRoundLogH5 model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                //SELECT * FROM t_game_round_log_h5
                string sqlCol = "SELECT  gr.*,u1.nickName as playNickName1,u2.nickName as playNickName2,u3.nickName as playNickName3,u4.nickName as playNickName4,u5.nickName as playNickName5,u6.nickName as playNickName6 ";

                sb.Append(sqlCol);

                sb.Append(" FROM t_game_round_log_h5 as gr");

                sb.AppendLine(@" LEFT JOIN t_user u1 on u1.userId = gr.player1 
LEFT JOIN t_user u2 on u2.userId = gr.player2
LEFT JOIN t_user u3 on u3.userId = gr.player3 
LEFT JOIN t_user u4 on u4.userId = gr.player4 
LEFT JOIN t_user u5 on u5.userId = gr.player5
LEFT JOIN t_user u6 on u6.userId = gr.player6");

                sb.AppendLine(" where  gr.clubId = @clubId and gr.roomNum = @roomNum");

                param.Add("@clubId", model.clubId);
                
                param.Add("@roomNum", model.round);

                if (!string.IsNullOrEmpty(model.startDate))
                {
                    sb.AppendLine(" and gr.updateTime>=@startDate "); 
                    param.Add("@startDate", model.startDate);
                }

                if (!string.IsNullOrEmpty(model.endDate))
                {
                    sb.AppendLine(" and gr.updateTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }
                //获取总记录数
                string sqlCount = sb.ToString().Replace(sqlCol, "select count(1) totalCount ");
                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_GameRoundLogH5>(sb.ToString(), param).ToList();
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
        /// 查询房间玩家输赢记录
        /// </summary>
        /// <returns></returns>
        public List<T_game_player_log> GetClubGamePlayer(T_game_player_log model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                sb.Append("SELECT * from t_game_player_log where  clubId = @clubId and roomNum = @roomNum");

                param.Add("@clubId", model.clubId);

                param.Add("@roomNum", model.roomNum);
                if (!string.IsNullOrEmpty(model.startDate))
                {
                    sb.Append(" and updateTime>=@startDate ");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrEmpty(model.endDate))
                {
                    sb.Append(" and updateTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }
                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT *", "select count(1) totalCount ");
                //分页记录列表
                var list = conn.Query<T_game_player_log>(sb.ToString(), param).ToList();
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


    }


}
