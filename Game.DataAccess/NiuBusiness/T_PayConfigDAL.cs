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
    
    public class T_PayConfigDAL : It_payConfig
    {

        /// <summary>
        /// 支付配置列表
        /// </summary>
        /// <returns></returns>
        public List<T_PayConfig> GetPayConfigs()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * from t_payConfig where 1=1");
                sb.Append(" order by sort asc");
           
                //分页记录列表
                var list = conn.Query<T_PayConfig>(sb.ToString(), param).ToList();
                return list;
            }
        }



        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public int UpdatePayConfig(T_PayConfig con)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                string sql = "UPDATE t_payConfig SET minMoney=@minMoney,maxMoney=@maxMoney,status=@status,updateTime=@updateTime,sort=@sort where id=@id";

                return conn.Execute(sql, con);
            }
        }






    }
}
