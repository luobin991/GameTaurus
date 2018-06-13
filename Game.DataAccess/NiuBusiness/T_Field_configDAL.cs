using System;
using System.Data;
using System.Text;
using System.Linq;
using System.Collections.Generic;
using Dapper;
using Game.Entity.Club;
using Game.Common.DBHelper;

namespace Game.DataAccess.NiuBusiness
{
    public class T_Field_configDAL:BusinessLogic.NiuBusiness.It_Field_config
    {


        public List<T_Field_config> GeFieldConfigs()
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT * FROM T_Field_config  ORDER BY typeId");
                var list = conn.Query<T_Field_config>(sb.ToString(), param);
                return list.ToList();
            }
        }

        /// <summary>
        /// 修改公共俱乐部百人牛牛场次配置
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool SetFieldCofig(T_Field_config entity)
        {
            using (IDbConnection conn = DapperAdapter.MySQLOpenConnection(ConfigurationHelper.MySQLConnectionStr))
            {
                DynamicParameters param = new DynamicParameters();
                StringBuilder sb = new StringBuilder();

                sb.Append(@"update T_Field_config set entryLimit = @entryLimit ,min_bet=@min_bet ,rate=@rate,isOpen=@isOpen WHERE typeId=@typeId");

                param.Add("@entryLimit", entity.entryLimit);
                param.Add("@min_bet", entity.min_bet);
                param.Add("@rate", entity.rate);
                param.Add("@isOpen", entity.isOpen);
                param.Add("@typeId", entity.typeId);

                return conn.Execute(sb.ToString(), param) > 0;
            }
        }



    }

}
