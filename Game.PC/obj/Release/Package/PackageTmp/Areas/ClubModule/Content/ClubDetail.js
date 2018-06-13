/*
 * 日 期：2018.01.30
 * 描 述：俱乐部 成员
	
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
            // 设置额度
            $('#ll_SetuUserDiamondLimit').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('userId');
                if (luoluo.checkrow(keyValue)) {
                    luoluo.layerForm({
                        id: 'form',
                        title: "【" + $('#girdtable').jfGridValue('userName') + "】额度设置",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubUser?user=' + keyValue + "&type=1&club=" + $('#girdtable').jfGridValue('clubId'),
                        width: 450,
                        height: 180,
                        callBack: function (id) {
                            return top[id].acceptClick(refreshGirdData);
                        }
                    });
                }
            });
        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                url: top.$.rootUrl + '/ClubModule/Club/GetClubDetailPage?clubid=' + objectId,
                headData: [
                        { label: '成员', name: 'userName', width: 150, align: 'center' },
                        { label: '加入日期', name: 'createTime', width: 150, align: 'center' },
                        //{ label: '持有金币', name: 'coin', width: 100, align: 'center' },
                        //{ label: '俱乐部划分金币数', name: 'coinLimit', width: 120, align: 'center' },
                        { label: '积分额度', name: 'scoreLimit', width: 100, align: 'center' },
                        { label: '当前积分', name: 'currentScore', width: 100, align: 'center' },
                        { label: '积分输赢', name: '12', width: 100, align: 'center', formatter: function (callback, row) { return (row.currentScore - row.scoreLimit) } },
                        
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