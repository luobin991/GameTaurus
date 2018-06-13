using System;
using System.Web.Mvc;
using System.Web.Routing;
using Ninject;
using Game.BusinessLogic.SysManage;
using Game.DataAccess.SysManage;
using Game.BusinessLogic.NiuBusiness;
using Game.DataAccess.NiuBusiness;

namespace Game.PC.WebSecurityHelper
{

    /// <summary>
    /// Ninject 轻量级IOC依赖注入框架辅助类
    /// </summary>
    public class NinjectFactory : DefaultControllerFactory
    {
        private IKernel ninjectKernel;

        public NinjectFactory()
        {
            //创建Ninject内核实例
            ninjectKernel = new StandardKernel();
            AddBindings();
        }
        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
        {
            //获得实现接口的对象实例
            return controllerType == null ? null : (IController)ninjectKernel.Get(controllerType);
        }
        /// <summary>
        /// 绑定接口到实现了该接口的类
        /// </summary>
        private void AddBindings()
        {
            //绑定接口到实现了该接口的类
            //系统功能
            ninjectKernel.Bind<ISys_User>().To<Sys_UserDAL>();
            ninjectKernel.Bind<ISys_MenuModule>().To<Sys_MenuModuleDAL>();
            ninjectKernel.Bind<ISys_Role>().To<Sys_RoleDAL>();
            ninjectKernel.Bind<ISys_Authorize>().To<Sys_AuthorizeDAL>();
            ninjectKernel.Bind<ISys_ModuleButton>().To<Sys_ModuleButtonDAL>();
            ninjectKernel.Bind<ISys_ModuleColumn>().To<Sys_ModuleColumnDAL>();
            ninjectKernel.Bind<ISys_UserRelation>().To<Sys_UserRelationDAL>();
            ninjectKernel.Bind<ISys_Log>().To<Sys_LogDAL>();

            //基础业务 牛牛
            ninjectKernel.Bind<IT_User>().To<T_UserDAL>();
            ninjectKernel.Bind<It_online_taurus>().To<T_Online_taurusDAL>();
            ninjectKernel.Bind<It_statistics_newuserlog>().To<T_Statistics_newuserlogDAL>();
            ninjectKernel.Bind<It_game_activity_config>().To<T_Game_activity_configDAL>();
            ninjectKernel.Bind<It_diamond_log>().To<T_Diamond_logDAL>();
            ninjectKernel.Bind<IT_Notice>().To<T_NoticeDAL>();
            ninjectKernel.Bind<It_Game_Log>().To<T_Game_LogDAL>();
            ninjectKernel.Bind<IT_platform_domain>().To<T_platform_domainDAL>();
            ninjectKernel.Bind<It_sectionConfig>().To<T_SectionConfigDAL>();
            ninjectKernel.Bind<It_payConfig>().To<T_PayConfigDAL>();
            ninjectKernel.Bind<It_Marquee>().To<T_MarqueeDAL>();

            //俱乐部
            ninjectKernel.Bind<It_Club>().To<T_ClubDAL>();
            ninjectKernel.Bind<It_Club_gamelog>().To<T_ClubGameLogDAL>();
            ninjectKernel.Bind<It_Field_config>().To<T_Field_configDAL>();


            //代理
            ninjectKernel.Bind<It_Agent_Relation>().To<T_Agent_RelationDAL>();


        }
    }

}