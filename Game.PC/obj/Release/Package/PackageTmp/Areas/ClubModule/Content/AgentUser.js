/*
 * 日 期：2017.11.30
 * 描 述：成员添加
 */
var objectId = request('userid');

var acceptClick;
var bootstrap = function ($, luoluo) {
    "use strict";


    var userlist = {};
    var userlistselected = [];
    var userlistselectedobj = {};

    // 渲染用户列表
    function renderUserlist(list) {

        var $warp = $('<div></div>');
        for (var i = 0, l = list.length; i < l; i++) {
            var item = list[i];
            var imgName = "UserCard02.png";

            var _cardbox = "";
            _cardbox += '<div class="card-box" data-value="' + item.Id + '" >';
            _cardbox += '    <div class="card-box-img">';
            _cardbox += '        <img src="' + top.$.rootUrl + '/Content/images/' + imgName + '" />';
            _cardbox += '    </div>';
            _cardbox += '    <div class="card-box-content">';
            _cardbox += '        <p>代理：' + item.nickName + '</p>';
            _cardbox += '        <p>阶数：' + item.applyClubCount + '</p>';
            _cardbox += '    </div>';
            _cardbox += '</div>';
            var $cardbox = $(_cardbox);
            $cardbox[0].userinfo = item;
            $warp.append($cardbox);
        }
        $('#user_list').html($warp);
    };

    var page = {
        init: function () {
            page.bind();
            page.initData();
        },
        bind: function () {
            // 滚动条
            $('#user_list_warp').mCustomScrollbar({ // 优化滚动条
                theme: "minimal-dark"
            });
            $('#selected_user_list_warp').mCustomScrollbar({ // 优化滚动条
                theme: "minimal-dark"
            });
        },
        initData: function () {
            $.llSetForm(top.$.rootUrl + '/ClubModule/Agent/GetHightAgentList?userid=' + objectId, function (data) {
                renderUserlist(data || []);
            });

        }
    };
    page.init();
}