/*
 * 日 期：2017.11.16
 * 描 述：每天新增人数在单项产品	
 */
var selectedRow;
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
                url: top.$.rootUrl + '/DataStatistics/NiuN/GetDayStatisticsPage',
                headData: [
                        { label: '日期', name: 'time', width: 200, align: 'center' },
                        { label: '有效人数', name: 'userNumber', width: 100, align: 'center' },
                        { label: '开房数量', name: 'roomNumber', width: 100, align: 'center' },
                        { label: '游戏局数', name: 'roundNumber', width: 100, align: 'center' },
                        { label: '钻石消耗总数', name: 'diamondNumber', width: 100, align: 'center' }
                        
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

    page.init();
};



