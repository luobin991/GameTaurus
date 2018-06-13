/*
 * 日 期：2018.01.30
 * 描 述：游戏战绩
	
 */
var selectedRow;
var refreshGirdData;
var userid;
var bootstrap = function ($, luoluo) {
    "use strict";
    var page = {
        init: function () {
            userid = $('#userid').val();
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
                    userid: userid
                });
            });

            // 刷新
            $('#ll_refresh').on('click', function () {
                location.reload();
            });
            //详情
            $('#ll_details').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('roomNum');
                if (luoluo.checkrow(keyValue)) {
                    luoluo.layerForm({
                        id: 'roomNum',
                        title: keyValue,
                        url: top.$.rootUrl + '/DataStatistics/GameLog/GameRootNumDetail?rootnum=' + keyValue,
                        height: 685,
                        width: 1210,
                        btn: null,
                    });
                }
            });
        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                url: top.$.rootUrl + '/DataStatistics/GameLog/GetGameLogPage?userid=' + userid,
                headData: [
                        { label: '房间号', name: 'roomNum', width: 80, align: 'center' },
                        { label: '玩法', name: 'bankerModeString', width: 100, align: 'center' },
                        { label: '局数', name: 'playedRound', width: 35, align: 'center' },
                        { label: '低分', name: 'baseScore', width: 35, align: 'center' },
                        { label: '时间', name: 'updateTime', width: 150, align: 'center' },

                        { label: '位置一', name: 'nickName1', width: 100, align: 'center' },
                        {
                            label: '位置一总成绩', name: 'score1', width: 100, align: 'center', formatter: function (callback, row) {
                                if (row.nickName1 != null)
                                    return callback;
                            }
                        },

                        { label: '位置二', name: 'nickName2', width: 100, align: 'center' },
                        {
                            label: '位置二总成绩', name: 'score2', width: 100, align: 'center', formatter: function (callback, row) {
                                if (row.nickName2 != null)
                                    return callback;
                            }
                        },

                        { label: '位置三', name: 'nickName3', width: 100, align: 'center' },
                        {
                            label: '位置三总成绩', name: 'score3', width: 100, align: 'center', formatter: function (callback, row) {
                                if (row.nickName3 != null)
                                    return callback;
                            }
                        },

                        { label: '位置四', name: 'nickName4', width: 100, align: 'center' },
                        {
                            label: '位置四总成绩', name: 'score4', width: 100, align: 'center', formatter: function (callback, row) {
                                if (row.nickName4 != null)
                                    return callback;
                            }
                        },

                        { label: '位置五', name: 'nickName5', width: 100, align: 'center' },
                        {
                            label: '位置五总成绩', name: 'score5', width: 100, align: 'center', formatter: function (callback, row) {
                                if (row.nickName5 != null)
                                    return callback;
                            }
                        },

                        { label: '位置六', name: 'nickName6', width: 100, align: 'center' },
                        {
                            label: '位置六总成绩', name: 'score6', width: 100, align: 'center', formatter: function (callback, row) {
                                if (row.nickName6 != null)
                                    return callback;
                            }
                        },
                ],
                isPage: true,
                reloadSelected: false,
                mainId: 'id'
            });
        },
        search: function (param) {
            param = param || {};
            $('#girdtable').jfGridSet('reload', { param: param });
        },

    };

    refreshGirdData = function () {
        var userid = $('#userid').val();
        var sdate = $('#sdate').val();
        var edate = $('#edate').val();
        page.search({
            userid: userid,
            sdate: sdate,
            edate: edate,
        });

    };
    page.init();
}