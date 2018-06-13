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
    public class GameUserDAL : I_GameUser
    {
        


        /// <summary>
        ///  获取 用户 钻石情况
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="userids"></param>
        /// <param name="typearr"> changedType 类型</param>
        /// <returns></returns>
        public List<T_Diamond_log> GetUserDiamond(int pageIndex, int pageSize, string startDate, string endDate, string userids, string typearr)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(@"SELECT  d.*,u.nickName  from t_diamond_log  d LEFT JOIN t_user u on d.userId = u.userId WHERE d.userid  in (" + userids + ") and changedType in (" + typearr + ")");

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
                sb.Append(" order by updateTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT  d.*,u.nickName  ", "select count(1) totalCount ");

                //分页
                if (pageIndex >= 0 && pageSize > 0)
                {
                    sb.Append(" limit " + (pageIndex * pageSize) + "," + pageSize);
                }

                var list = conn.Query<T_Diamond_log>(sb.ToString(), param).ToList();

                //分页记录列表
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

        

    }

}
