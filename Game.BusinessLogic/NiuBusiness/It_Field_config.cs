using Game.Entity.Club;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    public interface It_Field_config
    {
        List<T_Field_config> GeFieldConfigs();


        /// <summary>
        /// 修改公共俱乐部百人牛牛场次配置
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        bool SetFieldCofig(T_Field_config entity);


    }
}
