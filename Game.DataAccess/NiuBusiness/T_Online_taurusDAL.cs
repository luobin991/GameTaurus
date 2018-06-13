using System;
using System.Collections.Generic;
using Game.Entity.NiuBusiness;
using System.Data;
using Game.Common.DBHelper;
using Dapper;
using Game.BusinessLogic.NiuBusiness;
using System.Text;
using System.Linq;

namespace Game.DataAccess.NiuBusiness
{
    /// <summary>
    /// 时刻在线人数统计表
    /// </summary>
    public class T_Online_taurusDAL : It_online_taurus
    {

        /// <summary>
        /// 获取时间段的数据
        /// </summary>
        /// <returns></returns>
        public IEnumerable<T_Online_taurus> GetDayList(string startDate, string endDate)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("select * from t_online_taurus WHERE onlineCount>0 and  updateTime>=@startDate and updateTime<=@endDate ");
                param.Add("@startDate", startDate);
                param.Add("@endDate", endDate);
                sb.Append(" order by updateTime desc");

                var result = conn.Query<T_Online_taurus>(sb.ToString(), param);
                return result;
            }
        }




        /// <summary>
        /// 获取时间段的数据
        /// </summary>
        /// <returns></returns>
        public List<T_Online_taurus> GetPageList(T_Online_taurus model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("select * from t_online_taurus WHERE onlineCount>0 and updateTime>=@startDate and updateTime<=@endDate ");
                param.Add("@startDate", model.startDate);
                param.Add("@endDate", model.endDate);
                sb.Append(" order by updateTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("select * ", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Online_taurus>(sb.ToString(), param).ToList();
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
        /// 获取时间段的数据
        /// </summary>
        /// <returns></returns>
        public List<T_Statistics_day_report> GetDayStatisticsPage(T_Statistics_day_report model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("select * from t_statistics_day_report WHERE 1=1 ");
                if (!string.IsNullOrWhiteSpace(model.startDate))
                {
                    sb.Append(" and createTime >=@startDate ");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrWhiteSpace(model.endDate))
                {
                    sb.Append(" and createTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }
                sb.Append(" order by createTime desc");

                //获取总记录数
                string sqlCount = sb.ToString().Replace("select * ", "select count(1) totalCount ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Statistics_day_report>(sb.ToString(), param).ToList();
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
