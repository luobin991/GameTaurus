using Game.Entity.NiuBusiness;
using System.Collections.Generic;

namespace Game.BusinessLogic.NiuBusiness
{
    /// <summary>
    /// 时刻在线人数统计表
    /// </summary>
    public interface IT_platform_domain
    {


        /// <summary>
        /// 获取域名配置数据
        /// </summary>
        /// <returns></returns>
        List<T_platform_domain> GetPageList(T_platform_domain model);

        List<int> GetPlatformList();

    }
}
