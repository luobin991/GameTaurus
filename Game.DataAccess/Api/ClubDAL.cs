using System;
using System.Collections.Generic;
using Game.Entity.Club;
using System.Data;
using Game.Common.DBHelper;
using Dapper;
using Game.BusinessLogic.Api;
using System.Text;
using System.Linq;
using Game.Entity.NiuBusiness;

namespace Game.DataAccess.Api
{
    public class ClubDAL : I_Club
    {




        /// <summary>
        /// 俱乐部详细
        /// </summary>
        /// <param name="clubid"></param>
        /// <returns></returns>
        public T_Club GetClubinfo(int clubid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT c.*,u.nickName as creatName FROM t_club c LEFT JOIN t_user u on c.creatorId=u.userId WHERE 1=1 and clubId=@clubId ");
                param.Add("@clubId", clubid);

                var list = conn.Query<T_Club>(sb.ToString(), param).FirstOrDefault();
                return list;
            }
        }

        /// <summary>
        /// 查询俱乐部
        /// </summary>
        /// <returns></returns>
        public List<T_Club> GetClubPage(int userId)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(@"  SELECT c.* from  t_club_member  cm
                LEFT JOIN t_club c on cm.clubId = c.clubId
                WHERE cm.userId = " + userId + " ORDER BY peopleCount desc ");

                //分页记录列表
                var list = conn.Query<T_Club>(sb.ToString(), param).ToList();
                return list;
            }

        }


        /// <summary>
        /// 查询俱乐部成员
        /// </summary>
        /// <returns></returns>
        public List<T_Club_member> GetClubUser(int clubid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {

                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT c.*,u.nickName as userName ,u.headImgUrl as headImgUrl FROM T_Club_member c LEFT JOIN t_user u on c.userId=u.userId WHERE clubId=@clubId ");
                param.Add("@clubId", clubid);
                sb.Append("  order by position");

                //分页记录列表
                var list = conn.Query<T_Club_member>(sb.ToString(), param).ToList();

                return list;
            }
        }


        /// <summary>
        /// 查询俱乐部成员信息
        /// </summary>
        /// <returns></returns>
        public T_Club_member GetClubUserInfo(int clubid, int userid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {

                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" select m.*,u.nickName as userName ,u.headImgUrl as headImgUrl ,u.coin from t_club_member m LEFT JOIN t_user u on m.userid=u.userid where clubId = @clubId and m.userid = @userid ");
                param.Add("@clubId", clubid);
                param.Add("@userid", userid);

                //分页记录列表
                var list = conn.Query<T_Club_member>(sb.ToString(), param).FirstOrDefault();

                return list;
            }
        }

        /// <summary>
        ///  俱乐部成员游戏记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public List<T_game_player_log> GetClubUserGamelog(int pageIndex, int pageSize, string startDate, string endDate, int clubid, int userid)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                sb.Append(" SELECT * from t_game_player_log where clubId = @clubid ");

                param.Add("@clubId", clubid);

                if (userid > 0)
                {
                    sb.Append(" and  playerId=@userid");
                    param.Add("@userid", userid);
                }


                if (!string.IsNullOrEmpty(startDate))
                {
                    sb.Append(" and updateTime>=@startDate ");
                    param.Add("@startDate", startDate);
                }
                if (!string.IsNullOrEmpty(endDate))
                {
                    sb.Append(" and updateTime<=@endDate ");
                    param.Add("@endDate", endDate);
                }
                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT *" , "select count(1) totalCount ");

                //分页
                if (pageIndex >= 0 && pageSize > 0)
                {
                    sb.Append(" limit " + (pageIndex * pageSize) + "," + pageSize);
                }
                var list = conn.Query<T_game_player_log>(sb.ToString(), param).ToList();
                if (list != null && list.Count() > 0)
                {
                    //总记录数列表
                    dynamic identity = conn.Query(sqlCount, param).Single();
                    list[0].totalCount = Convert.ToInt64(identity.totalCount);
                    list[0].pageIndex = pageIndex;
                    list[0].pageSize = pageSize;
                }
                return list;
            }
        }

        /// <summary>
        ///  俱乐部游戏记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public List<T_game_room_log> GetClubGamelog(int clubid, int pageIndex, int pageSize, string startDate, string endDate)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(@"
                SELECT diamond,gr.* from  (SELECT clubId,roomNum, SUM(diamond) diamond FROM t_club_diamond_log where 1=1 GROUP BY  roomNum ORDER BY createTime desc) tb
                LEFT JOIN t_game_room_log gr on tb.clubId=gr.clubId and tb.roomNum=gr.roomNum
                where 1 = 1 
                ");
                sb.Append(" and gr.clubId = @clubid ");
                param.Add("@clubId", clubid);

                if (!string.IsNullOrEmpty(startDate))
                {
                    sb.Append(" and createTime>=@startDate ");
                    param.Add("@startDate", startDate);
                }
                if (!string.IsNullOrEmpty(endDate))
                {
                    sb.Append(" and updateTime<=@endDate ");
                    param.Add("@endDate", endDate);
                }
                sb.Append(" order by updateTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT diamond,gr.* ", "select count(1) totalCount ");

                //分页
                if (pageIndex >= 0 && pageSize > 0)
                {
                    sb.Append(" limit " + (pageIndex * pageSize) + "," + pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_game_room_log>(sb.ToString(), param).ToList();
                if (list != null && list.Count() > 0)
                {
                    //总记录数列表
                    dynamic identity = conn.Query(sqlCount, param).Single();
                    list[0].totalCount = Convert.ToInt64(identity.totalCount);
                    list[0].pageIndex = pageIndex;
                    list[0].pageSize = pageSize;
                }
                return list;
            }
        }

        /// <summary>
        ///  俱乐部消耗钻石 房间明细
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="roomNum"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public List<T_Club_diamond_log> GetClubChargeDetail(int clubid, int roomNum, int pageIndex, int pageSize)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT d.*,u.nickName from  t_club_diamond_log d LEFT JOIN t_user u on d.userId=u.userId ");
                sb.Append(" where clubId = @clubId and @roomNum = roomNum");
                param.Add("@clubId", clubid);
                param.Add("@roomNum", roomNum);
                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT d.*,u.nickName ", "select count(1) totalCount ");
                //分页
                if (pageIndex >= 0 && pageSize > 0)
                {
                    sb.Append(" limit " + (pageIndex * pageSize) + "," + pageSize);
                }
                var list = conn.Query<T_Club_diamond_log>(sb.ToString(), param).ToList();
                if (list != null && list.Count() > 0)
                {
                    //总记录数列表
                    dynamic identity = conn.Query(sqlCount, param).Single();
                    list[0].totalCount = Convert.ToInt64(identity.totalCount);
                    list[0].pageIndex = pageIndex;
                    list[0].pageSize = pageSize;
                }
                return list;

            }
        }


        /// <summary>
        ///  俱乐部成员额度消耗情况记录
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="userid"></param> T_Club_diamond_log
        /// <returns></returns>
        public List<T_Club_diamond_log> GetClubUserCosDiamondlog(int clubid, int userId, int pageIndex, int pageSize, string startDate, string endDate)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(@"SELECT * from T_Club_diamond_log ");
                sb.Append(" where clubId = @clubid  and userId=@userId");
                param.Add("@clubId", clubid);
                param.Add("@userId", userId);

                if (!string.IsNullOrEmpty(startDate))
                {
                    sb.Append(" and createTime>=@startDate ");
                    param.Add("@startDate", startDate);
                }
                if (!string.IsNullOrEmpty(endDate))
                {
                    sb.Append(" and createTime<=@endDate ");
                    param.Add("@endDate", endDate);
                }
                sb.Append(" order by createTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT * ", "select count(1) totalCount ");

                ////分页
                //if (pageIndex >= 0 && pageSize > 0)
                //{
                //    sb.Append(" limit " + (pageIndex * pageSize) + "," + pageSize);
                //}
                //分页记录列表
                var list = conn.Query<T_Club_diamond_log>(sb.ToString(), param).ToList();
                //if (list != null && list.Count() > 0)
                //{
                //    //总记录数列表
                //    dynamic identity = conn.Query(sqlCount, param).Single();
                //    list[0].totalCount = Convert.ToInt64(identity.totalCount);
                //    list[0].pageIndex = pageIndex;
                //    list[0].pageSize = pageSize;
                //}
                return list;
            }
        }

        /// <summary>
        /// 标识 俱乐部收费
        /// </summary>
        /// <param name="clubid"></param>
        /// <param name="roomNum"></param>
        /// <returns></returns>
        public bool SetClubCharge(int clubid, int roomNum)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                sb.Append(@"update t_game_log set isCharge = 1  WHERE roomNum=@roomNum and clubid =@clubid");
                param.Add("@roomNum", roomNum);
                param.Add("@clubid", clubid);
                return conn.Execute(sb.ToString(), param) > 0;
            }
        }



    }
}
