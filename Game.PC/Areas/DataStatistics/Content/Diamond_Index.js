/*
 * 日 期：2017.11.16
 * 描 述：每天新增人数在单项产品	
 */
var selectedRow;
var refreshGirdData;
var bootstrap = function ($, luoluo) {
    "use strict";
    var companyId = '';
    var departmentId = '';

    var page = {
        init: function () {
            //page.inittree();

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
                });
            });
            // 刷新
            $('#ll_refresh').on('click', function () {
                location.reload();
            });
        },
        initGird: function () {
            $('#girdtable').llAuthorizeJfGrid({
                url: top.$.rootUrl + '/DataStatistics/Diamond/GetPageList',
                headData: [
                        { label: '日期', name: 'time', width: 200, align: 'center' },
                        { label: '总消耗', name: 'consumption', width: 100, align: 'center' },
                        { label: '总充值', name: 'topup', width: 100, align: 'center' },
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
        });
    };

    page.init();
}


