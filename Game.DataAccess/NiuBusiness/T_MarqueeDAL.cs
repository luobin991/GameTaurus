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
    
    public class T_MarqueeDAL : It_Marquee
    {

        /// <summary>
        /// 跑马灯列表
        /// </summary>
        /// <returns></returns>
        public List<T_Marquee> GetMarqueeList()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * from t_marquee where 1=1");
                sb.Append(" order by pId asc");
           
                //分页记录列表
                var list = conn.Query<T_Marquee>(sb.ToString(), param).ToList();
                return list;
            }
        }



        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public int UpdateMarquee(T_Marquee con)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                string sql = "UPDATE t_marquee SET content=@content,voild=@voild,pId=@pId,updateTime=@updateTime where id=@id;";

                return conn.Execute(sql, con);
            }
        }






    }
}
