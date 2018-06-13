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
    /// 钻石
    /// </summary>
    public class T_Diamond_logDAL : It_diamond_log
    {

        /// <summary>
        /// 获取时间段的数据 统计的数据
        /// </summary>
        /// <returns></returns>
        public List<T_Diamond_log> GetPageList(T_Diamond_log model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();


                //sb.Append("SELECT DATE_FORMAT( updateTime,' %Y-%m-%d') updateTime,SUM(changedDiamond) changedDiamond from  t_diamond_log where changedType in (1,3,4,5) ");
                sb.Append("SELECT DATE_FORMAT( updateTime,' %Y-%m-%d') updateTime,SUM(if(changedType in (1,3,4,5,6),changedDiamond,0 )) as consumption,SUM(if(changedType in (10),changedDiamond,0 )) as topup from  t_diamond_log where 1=1 ");

                if (!string.IsNullOrWhiteSpace(model.startDate))
                {
                    sb.Append(" and updateTime>=@startDate");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrWhiteSpace(model.endDate))
                {
                    sb.Append(" and updateTime<=@endDate");
                    param.Add("@endDate", model.endDate);
                }
                sb.Append(" GROUP BY   DATE_FORMAT( updateTime,' %Y-%m-%d' ) ORDER BY  updateTime desc ");

                //获取总记录数
                string sqlCount = "select COUNT(*) totalCount  from  (" + sb.ToString() + ") as tb";

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Diamond_log>(sb.ToString(), param).ToList();
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



        /// <summary>
        /// 查询当天的钻石变动列表
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        public List<T_Diamond_log> GetDiamondList(string types)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                sb.Append("SELECT * from  t_diamond_log  WHERE changedType in (" + types + ") and updateTime  >CONCAT(CURDATE(),' 00:00:00')");

                var list = conn.Query<T_Diamond_log>(sb.ToString(), param).ToList();

                return list;
            }
        }


        /// <summary>
        /// 获取冲扣 钻石 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public List<T_Diamond_log> GetDiamondLogPage(T_Diamond_log model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                string type = model.changedType == 0 ? " changedType in (10,11)" : "changedType in (" + model.changedType.ToString() + ")";

                sb.Append("SELECT d.*,u.nickName from t_diamond_log d LEFT JOIN t_user u on d.userId = u.userId   WHERE " + type);


                if (!string.IsNullOrWhiteSpace(model.startDate))
                {
                    sb.Append(" and updateTime>=@startDate ");
                    param.Add("@startDate", model.startDate);
                }
                if (!string.IsNullOrWhiteSpace(model.endDate))
                {
                    sb.Append(" and updateTime<=@endDate ");
                    param.Add("@endDate", model.endDate);
                }

                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT d.*,u.nickName ", "SELECT COUNT(*)  ");
                
                sb.Append(" order by updateTime desc ");

                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }
                //分页记录列表
                var list = conn.Query<T_Diamond_log>(sb.ToString(), param).ToList();
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
