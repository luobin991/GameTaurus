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
    
    public class T_platform_domainDAL : IT_platform_domain
    {
        /// <summary>
        /// 获取域名配置数据
        /// </summary>
        /// <returns></returns>
        public List<T_platform_domain> GetPageList(T_platform_domain model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * from t_platform_domain_config where 1=1");

                if (!string.IsNullOrWhiteSpace(model.domainname))
                {
                    sb.Append(" and domainname like @domainname ");
                    param.Add("@domainname", "%" + model.domainname + "%");
                }
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
                //获取总记录数
                string sqlCount = sb.ToString().Replace("SELECT * ", "select count(1) totalCount ");

                sb.Append(" order by platformid asc, id desc");
                //分页
                if (model.pageIndex >= 0 && model.pageSize > 0)
                {
                    sb.Append(" limit " + ((model.pageIndex - 1) * model.pageSize) + "," + model.pageSize);
                }

                //分页记录列表
                var list = conn.Query<T_platform_domain>(sb.ToString(), param).ToList();
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

        public List<int> GetPlatformList()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT platformid from t_platform_domain_config GROUP BY platformid");
                //分页记录列表
                var list = conn.Query<int>(sb.ToString()).ToList();
                return list;
            }
        }
                



    }
}
