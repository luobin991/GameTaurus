/*
 * 日 期：2018.04.08
 * 描 述：钻石记录	
 */
var selectedRow;
var refreshGirdData;
var bootstrap = function ($, luoluo) {
    "use strict";
    var changedType = 0;

    var page = {
        init: function () {
            page.bind();

            page.initGird();

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
                    changedType: changedType
                });
            });
            // 类型选择
            $('#changeType').llselect({ placeholder:"请选择类型"}).on('change', function () {
                var val = $(this).llselectGet();

                if (val == "")
                    changedType = 0;
                else
                    changedType = val;
            });
            // 刷新
            $('#ll_refresh').on('click', function () {
                location.reload();
            });
        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                url: top.$.rootUrl + '/DataLog/Diamond/GetDiamondLogPage',
                headData: [
                        { label: '用户', name: 'nickName', width: 200, align: 'center' },
                        { label: '类型', name: 'changedTypeStr', width: 80, align: 'center' },
                        { label: '钻石数', name: 'changedDiamond', width: 100, align: 'center' },
                        { label: '时间', name: 'updateTime', width: 200, align: 'center' },
                ],
                isPage: true,
                reloadSelected: false,
                mainId: 'id'
            });
        },
        search: function (param) {
            param = param || {};
            $('#girdtable').jfGridSet('reload', { param: param });
        }
    };

    refreshGirdData = function () {
        var sdate = $('#sdate').val();
        var edate = $('#edate').val();
        page.search({
            sdate: sdate,
            edate: edate,
            changedType: changedType
        });
    };

    page.init();
}


