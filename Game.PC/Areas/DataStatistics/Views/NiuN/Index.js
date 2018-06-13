/*
 * 日 期：2017.11.16
 * 描 述：产品在线人数                          每2分钟统计一次玩家的在线人数，记录到数据库表
	
 */
var selectedRow;
var refreshGirdData;
var bootstrap = function ($, learun) {
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
            $('#lr_refresh').on('click', function () {
                location.reload();
            });
        },
        initGird: function () {
            $('#girdtable').lrAuthorizeJfGrid({
                url: top.$.rootUrl + '/DataStatistics/NiuN/GetOnlinePage',
                headData: [
                        { label: '时间', name: 'updateTime', width: 200, align: 'center' },
                        { label: '在线人数', name: 'onlineCount', width: 100, align: 'center' }
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


