/*
 * 日 期：2018.01.30
 * 描 述：俱乐部
	
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
            if(allcheck)
            {
                $("#jfgrid_all_cb_girdtable").attr('checked',true);
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
                    keyword: $('#txt_Keyword').val()
                });
            });

            // 刷新
            $('#ll_refresh').on('click', function () {
                location.reload();
            });
            //成员详情
            $('#ll_details').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('clubId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        id: 'roomNum',
                        title:  $('#girdtable').jfGridValue('clubName') + "成员详情",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubDetail?id=' + keyValue,
                        height: 685,
                        width: 1000,
                        btn: null,
                    });
                }
            });
            //战绩列表
            $('#ll_clubgamelist').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('clubId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        id: 'roomNum',
                        title: $('#girdtable').jfGridValue('clubName') + "战绩列表",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubGameList?id=' + keyValue,
                        height: 750,
                        width: 950,
                        btn: null,
                    });
                }
            });

            
            //消耗详情
            $('#ll_consumption').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('clubId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        id: 'roomNum',
                        title: $('#girdtable').jfGridValue('clubName') + "消耗详情",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubCosDetail?id=' + keyValue,
                        height: 685,
                        width: 1210,
                        btn: null,
                    });
                }
            });
            //扣钻百分比
            $('#ll_editdiamond').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('clubId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        id: 'form',
                        title: "【" + $('#girdtable').jfGridValue('clubName') + "】设置扣钻百分比",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubUser?user=0&type=0&club=' + keyValue,
                        width: 400,
                        height: 180,
                        callBack: function (id) {
                            return top[id].acceptClick(refreshGirdData);
                        }
                    });
                }
            });

            //增加俱乐部金币
            $('#ll_addCoin').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('clubId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        id: 'form',
                        title: "【" + $('#girdtable').jfGridValue('clubName') + "】增加金币",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubUser?user=0&type=3&club=' + keyValue,
                        width: 400,
                        height: 180,
                        callBack: function (id) {
                            return top[id].acceptClick(refreshGirdData);
                        }
                    });
                }
            });
            //减少俱乐部金币
            $('#ll_rmCoin').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('clubId');
                if (luoluo.checkrowofone(keyValue)) {
                    luoluo.layerForm({
                        id: 'form',
                        title: "【" + $('#girdtable').jfGridValue('clubName') + "】减少金币",
                        url: top.$.rootUrl + '/ClubModule/Club/ClubUser?user=0&type=4&club=' + keyValue,
                        width: 400,
                        height: 180,
                        callBack: function (id) {
                            return top[id].acceptClick(refreshGirdData);
                        }
                    });
                }
            });
            
            ////消息发送
            //$('#ll_sendMsg').on('click', function () {
            //    var keyValue = $('#girdtable').jfGridValue('id');
            //    var allcheck = $("#jfgrid_all_cb_girdtable").prop('checked');
            //    if (allcheck == true)
            //    {
            //        allcheck = 0;
            //    }
            //    if (luoluo.checkrow(keyValue)) {
            //        luoluo.layerForm({
            //            id: 'roomNum',
            //            title: $('#girdtable').jfGridValue('clubName'),
            //            url: top.$.rootUrl + '/ClubModule/Club/ClubCosDetail?id=' + keyValue,
            //            height: 685,
            //            width: 1210,
            //            btn: null,
            //        });
            //    }
            //});

        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                isMultiselect: false,
                url: top.$.rootUrl + '/ClubModule/Club/GetClubPage',
                headData: [
                        { label: '俱乐部名称', name: 'clubName', width: 150, align: 'left' },
                        { label: '创建者', name: 'creatName', width: 120, align: 'left' },
                        { label: '所属城市', name: 'city', width: 100, align: 'left' },
                        { label: '总人数', name: 'peopleCount', width: 50, align: 'center', sort: true },
                        { label: '扣钻百分比', name: 'diamondPercent', width: 100, align: 'center', formatter: function (callback) { return callback + "%" } },
                        { label: '积分池', name: 'scorePoolStr', width: 150, align: 'center' },
                        //{ label: '金币池', name: 'coinPoolStr', width: 150, align: 'center' },
                        { label: '创建时间', name: 'createTime', width: 150, align: 'center', sort: true },
                        { label: '介绍', name: 'clubIntroduce', width: 500, align: 'left' },
                ],
                isPage: true,
               reloadSelected: false,
               mainId: 'id',
               sidx: 'peopleCount',
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