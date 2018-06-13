/*
 * 日 期：2017.11.16
 * 描 述：牛牛房间10-20局详情
	
 */
var selectedRow;
var rootnum;
var bootstrap = function ($, luoluo) {
    "use strict";
    var page = {
        init: function () {
            rootnum = $('#rootnum').val();
            page.initGird();
            page.search();
        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                url: top.$.rootUrl + '/DataStatistics/GameLog/GetGameRoundByRoomNum?roomnum=' + rootnum,
                headData: [
                        {
                            label: '局数', name: 'round', width: 80, align: 'center', formatter: function (callback) {
                                return "第" + callback + "局";
                            }
                        },
                        {
                            label: '牌局一', name: 'resultNiu1', width: 180, align: 'center', formatter: function (callback, rows) {
                                return callback + rows.metro1;
                            }
                        },
                        {
                            label: '牌局二', name: 'resultNiu2', width: 180, align: 'center', formatter: function (callback, rows) {
                                return callback + rows.metro2;
                            }
                        },
                        {
                            label: '牌局三', name: 'resultNiu3', width: 180, align: 'center', formatter: function (callback, rows) {
                                return callback + rows.metro3;
                            }
                        },
                        {
                            label: '牌局四', name: 'resultNiu4', width: 180, align: 'center', formatter: function (callback, rows) {
                                return callback + rows.metro4;
                            }
                        },
                        {
                            label: '牌局五', name: 'resultNiu5', width: 180, align: 'center', formatter: function (callback, rows) {
                                return callback + rows.metro5;
                            }
                        },
                        {
                            label: '牌局六', name: 'resultNiu6', width: 180, align: 'center', formatter: function (callback, rows) {
                                return callback + rows.metro6;
                            }
                        }
                ],
                isPage: true,
                reloadSelected: false,
                mainId: 'roundIndex',
                onRenderComplete: false,
                onRenderComplete: function (data) {
                    $($(".jfgrid-heed-rownum_0")[1]).text(data[0].playNickName1 == null ? "" : data[0].playNickName1);
                    $($(".jfgrid-heed-rownum_0")[2]).text(data[0].playNickName2 == null ? "" : data[0].playNickName2);
                    $($(".jfgrid-heed-rownum_0")[3]).text(data[0].playNickName3 == null ? "" : data[0].playNickName3);
                    $($(".jfgrid-heed-rownum_0")[4]).text(data[0].playNickName4 == null ? "" : data[0].playNickName4);
                    $($(".jfgrid-heed-rownum_0")[5]).text(data[0].playNickName5 == null ? "" : data[0].playNickName5);
                    $($(".jfgrid-heed-rownum_0")[6]).text(data[0].playNickName6 == null ? "" : data[0].playNickName6);
                },
            });
        },
        search: function (param) {
            param = param || {};
            $('#girdtable').jfGridSet('reload', { param: param });
        },

    };

    page.init();
}