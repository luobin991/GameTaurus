using System;
using System.Web;
using System.Web.Mvc;
using Game.Entity.SysManage;
using Game.Common;
using Game.Api.Areas.api.InterfaceBLL;

namespace Game.Api.Areas.api.Controllers
{
    public partial class MainController : ApiBaseController
    {


        //根据方法调取接口
        [HttpGet]
        public JsonResult GetData(string functionname, string body)
        {

            T_User user = GetCache<T_User>("session_user");

            switch (functionname)
            {

                case "GetEnterInfo":
                case "getagentinfo":  //获取代理用户的信息
                    {
                        _Response res = new _Response();
                        res.code = 1;
                        res.body = user;
                        return Success(res);
                    }
                #region  俱乐部信息模块

                case "GetClubList":      //获取俱乐部
                    return Success(Club.Current.GetClubList(user.userId));

                case "getclubmemberlist": //俱乐部成员列表
                    return Success(Club.Current.GetClubmemberList(body));

                case "GetClubInfo": //俱乐部详细
                    return Success(Club.Current.GetClubInfo(body));

                case "GetClubAuth": //获取俱乐部身份认证
                    return Success(Club.Current.GetClubAuth(body, user.userId));

                case "GetClubUserInfo": //俱乐部成员信息
                    return Success(Club.Current.GetClubUserInfo(body));

                case "GetClubUserGamelog"://俱乐部成员游戏记录    V2
                    return Success(Club.Current.GetClubUserGamelog(body));

                case "GetClubGamelog"://俱乐部成员游戏记录
                    return Success(Club.Current.GetClubGamelog(body));

                case "GetClubUserCosDiamondlog": //获取俱乐部玩家记录
                    return Success(Club.Current.GetClubUserCosDiamondlog(body));

                case "GetClubChargeDetail": //俱乐部耗钻明细
                    return Success(Club.Current.GetClubChargeDetail(body));

                #endregion



                //#region 用户管理模块
                //case "GetLowerUser": //获取绑码玩家，下级玩家
                //    return Success(LowerUser.Current.GetLowerUserPage(body, user.userId));

                //case "GetLowerUserDiamond": //获取下级玩家 消费情况
                //    return Success(LowerUser.Current.GetLowerUserDiamond(body, user.userId));

                //case "GetLowerUserBuyDiamond": //获取下级玩家购买钻石情况
                //    return Success(LowerUser.Current.GetLowerUserBuyDiamond(body, user.userId));

                //#endregion

                case "GetMyBuyDiamond": //获取当前代理/群主购买钻石情况
                    return Success(GameUser.Current.GetMyBuyDiamond(body, user.userId));



                default:
                    return Fail("未知请求！", true);
            }

        }

        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="functionname"></param>
        /// <param name="body"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult PostData(string functionname, string body)
        {
            T_User user = GetCache<T_User>("session_user");

            switch (functionname)
            {

                case "SetClubCharge":  // 设置俱乐部开房收费 => 已收费
                    return Success(Club.Current.SetClubCharge(body));

                case "SetUserClubDiamondLimit": //设置俱乐部成员 可用钻石上限
                    return Success(Club.Current.SetUserClubDiamondLimit(body));

                case "AddClubMemberScoreLimit": //设置俱乐部成员 追加积分额度
                    return Success(Club.Current.AddClubMemberScoreLimit(body));

                case "setClubRate": //底分倍率 最小带入积分倍率   【积分】
                    return Success(Club.Current.setClubRate(body));
                case "AddClubMemberCoinLimit":
                    return Success(Club.Current.AddClubMemberCoinLimit(body));
                default:
                    return Fail("未知请求！", true);
            }
        }


    }
}