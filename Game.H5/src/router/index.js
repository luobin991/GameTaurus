import Vue from 'vue'
import Router from 'vue-router'


Vue.use(Router)

const Index = resolve => require(['../view/Home/Index'], resolve) //首页快捷导航


const Login = resolve => require(['../view/Login/Login'], resolve) //登陆页面
const pLogin = resolve => require(['../view/Login/pLogin'], resolve) //登陆页面
    //俱乐部

const SignalGroup = resolve => require(['../view/Group/SignalGroup'], resolve) //  俱乐部成员列表
const NewMember = resolve => require(['../view/Group/NewMember'], resolve) //  同意拒绝新的成员申请
const AddMember = resolve => require(['../view/Group/AddMember'], resolve) //添加新成员邀请新的成员
const ClubDetail = resolve => require(['../view/Group/ClubDetail'], resolve) //俱乐部详情
const ClubMember = resolve => require(['../view/Group/ClubMember'], resolve) //俱乐部成员资料
const ChargelogDetail = resolve => require(['../view/Group/ChargelogDetail'], resolve) //俱乐部耗钻统计
const ManagerSet = resolve => require(['../view/Group/ManagerSet'], resolve) //设置为管理员，新建管理员账号
const AccessSet = resolve => require(['../view/Group/AccessSet'], resolve) //管理的权限设置
const GiveScore = resolve => require(['../view/Group/GiveScore'], resolve) //赠送积分

import ClubMemberSearchDetail from '../view//Group/ClubMemberSearchDetail'
import ManagerList from '../view/Group/ManagerList'
import EditContract from '../view/Edit/EditContract'
import Chargelog from '../view/Group/Chargelog'
import UserGamelog from '../view/Group/UserGamelog'
import Consumelog from '../view/Group/Consumelog'
//个人设置
const My = resolve => require(['../view//My/My'], resolve) //个人资料
const myBuylog= resolve =>require(['../view/My/Buylog'],resolve) //个人购卡记录

    //修改用户密码 
import Password from '../view/Edit/Password'
import { Agent } from 'https';

//代理
const agent = resolve =>require(['../view/Agent/Index'],resolve) //代理页面


//
const router = new Router({
    routes: [{
            path: '/',
            name: 'Index',
            component: Index,
            meta: { requiresAuth: true },
        },
        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/plogin',
            name: 'plogin',
            component: pLogin
        },
        {
            path: '/signalgroup/:id/:szclubname',
            name: 'signalgroup',
            component: SignalGroup,
            meta: { requiresAuth: true },
        },
        {
            path: '/newmember/:id',
            name: 'newmember',
            component: NewMember,
            meta: { requiresAuth: true },
        },
        {
            path: '/addmember/:id',
            name: 'addmember',
            component: AddMember,
            meta: { requiresAuth: true },
        },
        {
            path: '/clubdetail/:id',
            name: 'ClubDetail',
            component: ClubDetail,
            meta: { requiresAuth: true },
        },
        {
            path: '/clubmember',
            name: 'clubmembers',
            component: ClubMember,
            meta: { requiresAuth: true },
        },
        {
            path: '/clubmembersearchdetail',
            name: 'ClubMemberSearchDetail',
            component: ClubMemberSearchDetail,
            meta: { requiresAuth: true },
        },
        {
            path: '/ChargelogDetail',
            name: 'ChargelogDetail',
            component: ChargelogDetail,
            meta: { requiresAuth: true },
        },
        /**新建管理员账号 */
        {
            path: '/managerset/:id/:nPlayerId',
            name: 'managerset',
            component: ManagerSet,
            meta: { requiresAuth: true },
        },
        {
            path: '/givescore/:id/:nPlayerId/:flagnum',
            name: 'givescore',
            component: GiveScore,
            meta: { requiresAuth: true },
        },
        {
            path: '/editcontract/:nPlayerId/',
            name: 'editcontract',
            component: EditContract,
            meta: { requiresAuth: true },
        },

        {
            path: '/accessset/:nPlayerId/:nClubId/:isManager',
            name: 'accessset',
            component: AccessSet,
            meta: { requiresAuth: true },
        },
      
      
        {
            path: '/managerlist/:id/',
            name: 'managerlist',
            component: ManagerList,
            meta: { requiresAuth: true },
        },
        {
            path: '/chargelog/:id/',
            name: 'chargelog',
            component: Chargelog,
            meta: { requiresAuth: true },
        }, 
        {
            path: '/UserGamelog',
            name: 'UserGamelog',
            component: UserGamelog,
            meta: { requiresAuth: true },
        },
        {
            path: '/Consumelog',
            name: 'Consumelog',
            component: Consumelog,
            meta: { requiresAuth: true },
        },

        //代理

        {
            path: '/Agent',
            name: 'Index',
            component: Agent,
            meta: { requiresAuth: true },
        },





        //修改用户密码
        {
            path: '/editpass',
            name: 'Password',
            component: Password,
            meta: { requiresAuth: true },
        },
        {
            path: '/Buylog',
            name: 'Buylog',
            component: myBuylog,
            meta: { requiresAuth: true },
        }

        
    ]
})


var auth = true;
router.beforeEach((to, from, next) => {
    // console.log(to);
    // console.log(from);
    let autho = to.matched.some(record => record.meta.requiresAuth);
    if (autho) {
        // console.log(true);
        // this route requires auth, check if logged in
        // if not, redirect to login page.

        if (!sessionStorage.getItem('NIUNIUTICKET')) {
            // console.log('token  不存在');
            next({
                path: "/login",
                query: { redirect: to.fullPath } //把要跳转的地址作为参数传到下一步
            });
        } else {
            next();
        }
    } else {
        next(); // 确保一定要调用 next()
    }
});


export default router