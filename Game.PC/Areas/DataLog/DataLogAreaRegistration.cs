using System.Web.Mvc;

namespace Game.PC.Areas.DataLog
{
    public class DataLogAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "DataLog";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "DataLog_default",
                "DataLog/{controller}/{action}/{id}",
                new { action = "DiamondLog", id = UrlParameter.Optional }
            );
        }
    }
}