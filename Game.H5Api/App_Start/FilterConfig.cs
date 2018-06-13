using System;
using System.Web.Mvc;

namespace Game.Api
{

    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new CustomErrorAttribute());
            filters.Add(new HandleErrorAttribute());

        }
    }
}