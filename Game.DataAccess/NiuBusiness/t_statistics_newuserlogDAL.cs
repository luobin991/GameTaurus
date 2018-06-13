using System;
using System.Text;
using System.Collections.Generic;
using Game.Entity.NiuBusiness;
using System.Data;
using Game.Common.DBHelper;
using Dapper;
using Game.BusinessLogic.NiuBusiness;
using System.Linq;

namespace Game.DataAccess.NiuBusiness
{
    /// <summary>
    /// 每天新增人数在单项产品的统计
    /// </summary>
    public class T_Statistics_newuserlogDAL : It_statistics_newuserlog
    {

        /// <summary>
        /// 获取/新增人数在单项产品的统计
        /// </summary>
        /// <returns></returns>
        public List<T_Statistics_newuserlog> GetPageList(T_Statistics_newuserlog model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                try
                {
                    StringBuilder sb = new StringBuilder();
                    DynamicParameters param = new DynamicParameters();
                    sb.Append("select * from t_statistics_newuserlog WHERE 1=1");
                    if (!string.IsNullOrWhiteSpace(model.startDate))
                    {
                        sb.Append(" and createTime >=@startDate ");
                        param.Add("@startDate", model.startDate);
                    }
                    if (!string.IsNullOrWhiteSpace(model.@endDate))
                    {
                        sb.Append(" and createTime<=@endDate ");
                        param.Add("@endDate", model.endDate);
                    }
                    sb.Append(" order by createTime desc ");
                    //获取总记录数
                    string sqlCount = sb.ToString().Replace("select * ", "select count(1) totalCount ");

                    //分页
                    if (model.pageIndex >= 0 && model.pageSize > 0)
                    {
                        sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                    }
                    //分页记录列表
                    var list = conn.Query<T_Statistics_newuserlog>(sb.ToString(), param).ToList();
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
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
            }


        }





    }
}
