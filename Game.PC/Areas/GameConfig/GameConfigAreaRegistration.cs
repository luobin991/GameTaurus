using System.Web.Mvc;

namespace Game.PC.Areas.GameConfig
{
    public class GameConfigAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "GameConfig";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "GameConfig_default",
                "GameConfig/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}