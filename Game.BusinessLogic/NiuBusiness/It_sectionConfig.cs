using System;
using System.Collections.Generic;
using Game.Entity.Club;
using Game.Entity.NiuBusiness;


namespace Game.BusinessLogic.NiuBusiness
{
    public interface It_sectionConfig
    {
        List<T_SectionConfig> GetSectionConfigs();


        int UpdateSectionConfig(T_SectionConfig con);

    }



}
