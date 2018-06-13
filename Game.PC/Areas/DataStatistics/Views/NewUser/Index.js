/*
 * 日 期：2017.11.16
 * 描 述：每天新增人数在单项产品	
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

            $('#lr_enabled').on('click', function () {
                var keyValue = $('#girdtable').jfGridValue('F_UserId');
                if (learun.checkrow(keyValue)) {
                    learun.layerConfirm('是否确认要【启用】账号！', function (res) {
                        if (res) {
                            learun.postForm(top.$.rootUrl + '/LR_OrganizationModule/User/UpdateState', { keyValue: keyValue, state: 1 }, function () {
                                refreshGirdData();
                            });
                        }
                    });
                }
            });

        },
        initGird: function () {
            $('#girdtable').lrAuthorizeJfGrid({
                url: top.$.rootUrl + '/DataStatistics/NewUser/GetPageList',
                headData: [
                        { label: '日期', name: 'time', width: 200, align: 'center' },
                        { label: '开房数量', name: 'roomNumber', width: 100, align: 'center' },
                        { label: '游戏局数', name: 'roundNumber', width: 100, align: 'center' }
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


