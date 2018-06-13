/*
 * 日 期：2018.01.30
 * 描 述：下级代理 成员
	
 */
var selectedRow;
var refreshGirdData;
var objectId = request('id');

var bootstrap = function ($, luoluo) {
    "use strict";
    var page = {
        init: function () {
            page.initGird();
            page.bind();
            page.search();
        },
        bind: function () {
            // 查询
            $('#btn_Search').on('click', function () {
                var sdate = $('#sdate').val();
                var edate = $('#edate').val();
                page.search({
                    sdate: sdate,
                    edate: edate,
                    keyword: $('#txt_Keyword').val()
                });
            });
            // 刷新
            $('#ll_refresh').on('click', function () {
                location.reload();
            });
    
        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                url: top.$.rootUrl + '/ClubModule/Agent/GetAgentPage?id=' + objectId,
                headData: [
                     { label: '游戏ID', name: 'userId', width: 80, align: 'center' },
                    { label: '微信ID', name: 'wxId', width: 100, align: 'center', sort: true },
                    { label: '代理玩家', name: 'nickName', width: 150, align: 'center', sort: true },
                    { label: '手机', name: 'phoneNum', width: 100, align: 'center', sort: true },
                    { label: '推荐码', name: 'userId', width: 80, align: 'center', sort: true },
                    { label: '剩余钻石', name: 'diamond', width: 80, align: 'center', sort: true },
                    { label: '最后登录时间', name: 'loginTime', width: 140, align: 'center', sort: true },

                    { label: '今日消耗钻石-俱乐部', name: 'TodayClubCos', width: 130, align: 'center', sort: true },
                    { label: '今日消耗钻石-个人', name: 'TodayCos', width: 110, align: 'center', sort: true },
                    { label: '今日新增用户数', name: 'TodayAddUser', width: 100, align: 'center', sort: true },
                    { label: '今日用户充值金额', name: 'TodayUserDiamond', width: 110, align: 'center', sort: true },
                    { label: '用户充值', name: 'UserDiamond', width: 100, align: 'center', sort: true },
                    { label: '下级代理会员总数', name: 'LowerUserCount', width: 110, align: 'center', sort: true },

                    { label: '代理时间', name: 'createTime', width: 140, align: 'center', sort: true },
                    { label: '代理的邀请人', name: 'inviteUserName', width: 100, align: 'center' },
                    { label: '代理的上级代理', name: 'higherUName', width: 100, align: 'center' },
                ],
                isPage: true,
                reloadSelected: false,
                mainId: 'id',
                sidx: 'id',
                sord: 'desc',
            });
        },

        search: function (param) {
            param = param || {};
            $('#girdtable').jfGridSet('reload', { param: param });
        },
    };

    refreshGirdData = function () {
        var sdate = $('#sdate').val();
        var edate = $('#edate').val();
        page.search({
            sdate: sdate,
            edate: edate,
            keyword: $('#txt_Keyword').val()
        });
    };

    page.init();
    page.search();
}