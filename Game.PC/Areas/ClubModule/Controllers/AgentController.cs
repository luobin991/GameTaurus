using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Game.Entity;
using Game.Common;
using Game.Entity.NiuBusiness;
using Game.Entity.SysManage;
using Game.BusinessLogic.NiuBusiness;
using Game.BusinessLogic.SysManage;

namespace Game.PC.Areas.ClubModule.Controllers
{
    //代理
    public class AgentController : MvcControllerBase
    {

        #region 初始化
        private readonly It_Agent_Relation _agent;
        /// <summary>
        /// 玩家用户
        /// </summary>
        private readonly IT_User _user;

        public AgentController(It_Agent_Relation agent, IT_User user)
        {
            this._agent = agent;
            this._user = user;
        }

        #endregion

        #region 代理页面
        /// <summary>
        /// 代理管理
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 获取代理列表-分页
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public ActionResult GetAgentPage(string pagination, string sdate, string edate, string keyword, int id)
        {
            Pagination paginationobj = pagination.ToObject<Pagination>();
            AgentDatas model = new AgentDatas();
            model.pageIndex = paginationobj.page;
            model.pageSize = paginationobj.rows;
            model.totalCount = paginationobj.total;
            model.startDate = sdate;
            model.endDate = edate;
            model.nickName = keyword;
            model.higherAgent = id;
            model.orderBy = paginationobj.sidx + " " + paginationobj.sord;
            List<AgentDatas> list = this._agent.GetAgentPage(model);

            var jsonData = new
            {
                rows = list,
                total = list.Count > 0 ? list[0].total : 0,
                page = paginationobj.page,
                records = list.Count > 0 ? list[0].totalCount : 0
            };
            return Success(jsonData);
        }

        #endregion

        #region 上级代理界面

        /// <summary>
        /// 上级代理列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult HigherAgentIndex(int userid)
        {
            ViewBag.agent = userid;
            return View();
        }


        /// <summary>
        /// 获取用户的 所有上级代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public ActionResult GetHightAgentList(int userid)
        {
            T_Agent_Relation model = this._agent.GetAgent(userid);

            if (model != null)
            {
                if (!string.IsNullOrWhiteSpace(model.agentUsers))
                {
                    Dictionary<int, int> dic = new Dictionary<int, int>();
                    List<int> ids = new List<int>();

                    foreach (var item in model.agentUsers.Split(','))
                    {
                        string[] id_Index_s = item.Split('_');
                        int ID = Convert.ToInt32(id_Index_s[0]);
                        int index = Convert.ToInt32(id_Index_s[1]);
                        dic[ID] = index;
                        ids.Add(ID);
                    }

                    List<T_User> userList = this._user.GetAgentList(ids.ToArray());

                    for (int i = 0; i < userList.Count; i++)
                    {
                        userList[i].applyClubCount = dic[userList[i].userId];
                    }
                    userList = userList.OrderBy(w => w.applyClubCount).ToList();
                    return Success(userList);
                }
            }

            return Success("");
        }

        #endregion

        #region 下级代理

        public ActionResult LowerAgentPage()
        {
            return View();
        }

        #endregion


        #region 设置、取消，通知变更
        /// <summary>
        /// 设置代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetUserForAgent(int userid)
        {
            bool result = this._agent.SetUserforAgent(userid);

            if (result)
            {
                PostGameSericeApi(userid, true);
                return Success("设置成功");
            }
            else
                return Fail("设置失败");
        }

        /// <summary>
        /// 取消代理
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetAgentForUser(int userid)
        {
            bool result = this._agent.SetAgentForUser(userid);

            if (result)
            {
                PostGameSericeApi(userid, false);
                return Success("设置成功");
            }
            else
                return Fail("设置失败");
        }

        /// <summary>
        /// 通知游戏服务，代理变更消息
        /// </summary>
        /// <param name="userid"></param>
        /// <param name="type"></param>
        private void PostGameSericeApi(int userid, bool type)
        {
            //0成功，非0表示失败
            var data = new
            {
                userId = userid,
            };

            string json = JSONHelper.ObjectToJSON(data);
            // setUserProxy             升级为代理
            // cancelUserProxy       取消代理身份
            bool result = WebSecurityHelper.GameServerApi.ToPost(type ? "setUserProxy" : "cancelUserProxy", json).result;

            WebSecurityHelper.LogCommon.Current.WriteLog_Operation(Game.Entity.OperationType.Update, (result ? "1" : "0"), "代理管理", userid + (type ? "升级为代理" : "取消代理身份"));

        }


        /// <summary>
        /// 修改代理状态
        /// </summary>
        /// <param name="keyValue"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public ActionResult UpdateState(int keyValue, int status)
        {
            if (keyValue > 0)
            {
                T_Agent_Relation model = new T_Agent_Relation();
                model.userId = keyValue;
                model.status = status;
                int result = this._agent.Update(model, new string[] { "status" });

                return Response(result);
            }
            else
                return Fail("错误：未知记录ID");
        }

        #endregion




    }
}