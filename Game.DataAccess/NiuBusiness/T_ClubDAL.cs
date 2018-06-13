using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;
using System.Data;
using Game.Common.DBHelper;
using Dapper;
using Game.BusinessLogic.NiuBusiness;
using System.Text;
using System.Linq;

namespace Game.DataAccess.NiuBusiness
{
    public class T_ClubDAL : It_Club
    {

        /// <summary>
        /// 查询俱乐部
        /// </summary>
        /// <returns></returns>
        public List<T_Club> GetClubPage(T_Club model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT c.*,u.nickName as creatName FROM t_club c LEFT JOIN t_user u on c.creatorId=u.userId WHERE 1=1 ");

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

                if (!string.IsNullOrEmpty(model.clubName))
                {
                    sb.Append(" and clubName like @clubName and city like @clubName");
                    param.Add("@clubName", "%" + model.clubName + "%");
                }
                if (!string.IsNullOrWhiteSpace(model.orderBy))
                {
                    sb.Append("  order by " + model.orderBy);
                }
                //获取总记录数
                string sqlCount = sb.ToString().Replace(" SELECT c.*,u.nickName as creatName ", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Club>(sb.ToString(), param).ToList();
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
        /// 查询俱乐部成员
        /// </summary>
        /// <returns></returns>
        public List<T_Club_member> GetClubUserPage(T_Club_member model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {

                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT c.*,u.nickName as userName ,u.coin FROM T_Club_member c LEFT JOIN t_user u on c.userId=u.userId WHERE clubId=@clubId ");
                param.Add("@clubId", model.clubId);

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

                if (!string.IsNullOrEmpty(model.userName))
                {
                    sb.Append(" and nickName like @Name ");
                    param.Add("@Name", "%" + model.userName + "%");
                }

                sb.Append("  order by createTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT c.*,u.nickName as userName", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Club_member>(sb.ToString(), param).ToList();
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
        /// 获取俱乐部配置
        /// </summary>
        /// <returns></returns>
        public List<T_Club_config> GetClubConfig()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                var list = conn.Query<T_Club_config>("SELECT * from t_club_config", null).ToList();
                return list;
            }
        }


        /// <summary>
        /// 俱乐部消耗记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public List<sys_daysum_diamond> GetClubSumDiamond(sys_daysum_diamond model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {

                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT * FROM sys_daysum_diamond WHERE type=2 and diamondType=1 and typeId=@clubId ");
                param.Add("@clubId", model.typeId);

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

                sb.Append("  order by createTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT *", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<sys_daysum_diamond>(sb.ToString(), param).ToList();
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
