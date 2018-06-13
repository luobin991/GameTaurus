﻿using Game.BusinessLogic.SysManage;
using Game.Common;
using Game.DataAccess.SysManage;
using Game.Entity;
using Game.Entity.SysManage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Game.Api.WebSecurityHelper
{/// <summary>
 /// 登录凭据
 /// </summary>
    public class Passport
    {
        /// <summary>
        /// 当前登录凭据
        /// </summary>
        public static Passport Current
        {
            get
            {
                return new Passport();
            }
        }
        /// <summary>
        /// 当前用户是否已登录
        /// </summary>
        public bool IsAuthenticated { get { return HttpContext.Current.User.Identity.IsAuthenticated; } }

        /// <summary>
        /// 当前登录用户Id
        /// </summary>
        public int UserId
        {
            get
            {
                if (IsAuthenticated)
                {
                    return StringHelper.TryGetInt(HttpContext.Current.User.Identity.Name.Split('|')[0]);
                }
                return -1;
            }
        }

        /// <summary>
        /// 菜单模块
        /// </summary>
        public List<ModuleEntity> MenuModuleList
        {
            get
            {
                try
                {
                    if (IsAuthenticated)
                    {
                        ISys_MenuModule menu = new Sys_MenuModuleDAL();
                        //超级管理员
                        if (Convert.ToInt32(HttpContext.Current.User.Identity.Name.Split('|')[3]) == 1007001)
                        {
                            return menu.GetMenuList(StructDictCode.状态.正常).ToList();
                        }
                        else
                        {
                            //0. 缓存不存在
                            List<ModuleEntity> list = menu.GetMenuList(HttpContext.Current.User.Identity.Name.Split('|')[0]);
                            if (list == null || list.Count() == 0)
                            {
                                //根据 用户 and 角色 合计权限
                                //1.获取当前用户的权限
                                ISys_Authorize authorize = new Sys_AuthorizeDAL();
                                List<Sys_Authorize> UserAuthorizeList = authorize.GetList(HttpContext.Current.User.Identity.Name.Split('|')[0], 1).ToList();
                                //2.获取当前用户所在角色
                                ISys_UserRelation userRole = new Sys_UserRelationDAL();
                                IEnumerable<Sys_UserRelation> userRoleList = userRole.GetRoleIdList(HttpContext.Current.User.Identity.Name.Split('|')[0]);
                                foreach (var item in userRoleList)
                                {
                                    UserAuthorizeList.AddRange(authorize.GetList(item.F_ObjectId, 1));
                                }
                                //3.去除重复的 得到菜单ID
                                List<string> itemIds = new List<string>();
                                foreach (var item in UserAuthorizeList)
                                {
                                    if (item.itemType == 1 && !itemIds.Contains(item.itemId))
                                    {
                                        itemIds.Add(item.itemId);
                                    }
                                }
                                //4 根据菜单ID 返回权限菜单列表
                                return menu.GetMenuList(StructDictCode.状态.正常, string.Join(",", itemIds.ToArray()), HttpContext.Current.User.Identity.Name.Split('|')[0]).ToList();
                            }
                            else
                                return list;
                        }
                    }
                }
                catch (Exception ex)
                {

                    throw;
                }
                return new List<ModuleEntity>();
            }
        }








    }
}