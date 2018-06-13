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



    public class T_Game_activity_configDAL : It_game_activity_config
    {


        /// <summary>
        /// 获取配置数据
        /// </summary>
        /// <returns></returns>
        public IEnumerable<T_Game_activity_config> GetGameConfigList()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * FROM t_game_activity_config");
                sb.Append(" order by id asc");

                var result = conn.Query<T_Game_activity_config>(sb.ToString(), param);
                return result;
            }
        }


        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public int UpdateActivityConfig(T_Game_activity_config con)
        {

            string sql = "UPDATE t_game_activity_config SET addDiamond=@addDiamond where id=@id";
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                return conn.Execute(sql, con);
            }
        }



    }



}
