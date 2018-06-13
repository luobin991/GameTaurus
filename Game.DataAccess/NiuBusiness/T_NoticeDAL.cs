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
    public class T_NoticeDAL : IT_Notice
    {

        /// <summary>
        /// 新增公告
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Insert(T_Notice model)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                return conn.Execute("insert into t_notice (content,createTime,updateTime) values(@content,@createTime,@updateTime);", model);
            }
        }

        /// <summary>
        /// 获取公告最新的一条数据
        /// </summary>
        /// <returns></returns>
        public T_Notice GetPlacardsetByDESC()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                var result = conn.Query<T_Notice>("SELECT * from t_notice ORDER BY  createTime desc LIMIT 0,1;", null);
                return result == null ? null : result.FirstOrDefault();
            }
        }




        /// <summary>
        /// 获取跑马灯的数据
        /// </summary>
        /// <returns></returns>
        public List<T_Notice> GetMarqueeList()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                var result = conn.Query<T_Notice>("SELECT * from t_marquee ORDER BY  pId  ;", null);
                return result.ToList();
            }
        }









    }


}
