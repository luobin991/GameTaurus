/*
 * 日 期：2018.01.30
 * 描 述：代理
	
 */
var selectedRow;
var refreshGirdData;
var bootstrap = function ($, luoluo) {
    "use strict";
    var page = {
        init: function () {
            page.initGird();
            page.bind();
            page.search();
            var allcheck = $("#jfgrid_all_cb_girdtable").prop('checked');
            if (allcheck) {
                $("#jfgrid_all_cb_girdtable").attr('checked', true);
            }
        },
        bind: function () {
            // 查询
            $('#btn_Search').on('click', function () {
                var sdate = $('#sdate').val();
                var edate = $('#edate').val();
                page.search({
                    sdate: sdate,
                    edate: edate,
                    keyword: $('#txt_Keyword').val(),
                });
            });

            // 刷新
            $('#ll_refresh').on('click', function () {
                location.reload();
            });

            //启用账户
            $('#ll_enabled').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('userId');
                if (luoluo.checkrow(keyValue)) {
                    luoluo.layerConfirm('是否确认要【启用】代理！', function (res) {
                        if (res) {
                            luoluo.postForm(top.$.rootUrl + '/ClubModule/Agent/UpdateState', { keyValue: keyValue, status: 0 }, function () {
                                refreshGirdData();
                            });
                        }
                    });
                }
            });

            // 冻结
            $('#ll_disabled').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('userId');
                if (luoluo.checkrow(keyValue)) {
                    luoluo.layerConfirm('是否确认要【禁用】代理！', function (res) {
                        if (res) {
                            luoluo.postForm(top.$.rootUrl + '/ClubModule/Agent/UpdateState', { keyValue: keyValue, status: 1 }, function () {
                                refreshGirdData();
                            });
                        }
                    });
                }
            });

            //上级代理
            $('#ll_higherDetails').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('userId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        //id: 'roomNum',
                        title: "【" + $('#girdtable').jfGridValue('nickName') + "】所有上级代理",
                        url: top.$.rootUrl + '/ClubModule/Agent/HigherAgentIndex?userid=' + keyValue,
                        height: 685,
                        width: 600,
                        btn: null,
                    });
                }
            });

            //下级代理
            $('#ll_loweragent').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('userId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        //id: 'roomNum',
                        title: "【" + $('#girdtable').jfGridValue('nickName') + "】下级代理",
                        url: top.$.rootUrl + '/ClubModule/Agent/LowerAgentPage?id=' + keyValue,
                        height: 685,
                        width: 1500,
                        btn: null,
                    });
                }
            });

            //取消代理
            $('#ll_cancel').on('click', function () {

                var keyValue = $('#girdtable').jfGridValue('userId');
                if (luoluo.checkrow(keyValue)) {
                    luoluo.layerConfirm('是否确认要取消【' + $('#girdtable').jfGridValue('nickName') + '】的代理身份！', function (res) {
                        if (res) {
                            luoluo.postForm(top.$.rootUrl + '/ClubModule/Agent/SetAgentForUser', { userid: keyValue }, function () {
                                refreshGirdData();
                            });
                        }
                    });
                }

            });

        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                //isMultiselect: true, //选择多行
                url: top.$.rootUrl + '/ClubModule/Agent/GetAgentPage?id=0',
                headData: [
                    { label: '游戏ID', name: 'userId', width: 80, align: 'center' },
                    { label: '微信ID', name: 'wxId', width: 100, align: 'center', sort: true },
                    { label: '代理玩家', name: 'nickName', width: 150, align: 'center', sort: true },
                    { label: '手机', name: 'phoneNum', width: 100, align: 'center', sort: true },
                    {
                        label: '推荐码', name: 'userIdCode', width: 80, align: 'center', sort: true, formatter: function (callback, rows) {
                            return rows.userid
                        }
                    },
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
                    {
                        label: '状态', name: 'status', width: 50, align: 'center', formatter: function (callback) {
                            if (callback == 1)
                                return '<i class="fa fa-toggle-off" title="禁用"></i>'; //1
                            else
                                return '<i class="fa fa-toggle-on" title="正常"></i>';//0
                        }
                    },
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
            keyword: $('#txt_Keyword').val(),
            sdate: sdate,
            edate: edate,
        });

    };
    page.init();
}