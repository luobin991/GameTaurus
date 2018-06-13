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
    
    public class T_SectionConfigDAL : It_sectionConfig
    {

        /// <summary>
        /// 区间配置列表
        /// </summary>
        /// <returns></returns>
        public List<T_SectionConfig> GetSectionConfigs()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * from t_sectionconfig where 1=1");
                sb.Append(" order by secType asc");
           
                //分页记录列表
                var list = conn.Query<T_SectionConfig>(sb.ToString(), param).ToList();
                return list;
            }
        }



        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public int UpdateSectionConfig(T_SectionConfig con)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                string sql = "UPDATE t_sectionconfig SET minMoney=@minMoney,maxMoney=@maxMoney,scale=@scale,updateTime=@updateTime where secType=@secType";
                param.Add("@minMoney", con.minMoney);
                param.Add("@maxMoney", con.maxMoney);
                param.Add("@scale", con.scale);
                param.Add("@updateTime", con.updateTime);

                return conn.Execute(sql, con);
            }
        }






    }
}
