webpackJsonp([12],{FSV4:function(t,e,s){"use strict";Object.defineProperty(e,"__esModule",{value:!0});s("OgVB");var a=s("/Lyv"),i=s.n(a),n=s("mvHQ"),r=s.n(n),o={name:"addmember",data:function(){return{value:"s搜索人昵称",show:!1,id:0,resultshow:!1,user:{}}},methods:{add:function(){var t=this,e={functionname:"InviteUserClubMember",body:r()({nClubId:parseInt(this.id),nPlayerId:parseInt(this.user.nPlayerId)})};this.$http.post(this.baseUrl+"/Main/PostData",e).then(function(e){var s=e.data;1==s.code?(t.user.nStatus=3,i()("提示",s.msg)):i()("提示",s.msg)}).catch(function(t){i()("提示","出错了")})},search:function(){var t=this;this.resultshow=!0;var e={params:{functionname:"getuserclubmemberinfo",body:r()({nClubId:parseInt(this.id),nPlayerId:parseInt(this.value)})}};this.$http.get(this.baseUrl+"/Main/GetData",e).then(function(e){var s=e.data;1==s.code?0==s.totalCount?t.show=!0:(t.show=!1,t.user=s.body):i()("提示",s.msg)}).catch(function(t){i()("提示","网络异常")})}},created:function(){this.id=parseInt(this.$route.params.id)}},c={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"addmember"}},[a("mt-header",{attrs:{title:"添加俱乐部成员",fixed:!0}},[a("mt-button",{attrs:{slot:"left",icon:"back"},nativeOn:{click:function(e){t.$router.go(-1)}},slot:"left"},[t._v("返回")])],1),t._v(" "),a("div",{staticClass:"mint-searchbar"},[a("div",{staticClass:"mint-searchbar-inner"},[a("i",{staticClass:"mintui mintui-search"}),t._v(" "),a("input",{directives:[{name:"model",rawName:"v-model.trim",value:t.value,expression:"value",modifiers:{trim:!0}}],staticClass:"mint-searchbar-core",attrs:{type:"number",placeholder:"玩家id"},domProps:{value:t.value},on:{input:function(e){e.target.composing||(t.value=e.target.value.trim())},blur:function(e){t.$forceUpdate()}}})]),t._v(" "),a("a",{staticClass:"mint-searchbar-cancel",on:{click:t.search}},[t._v("搜索")])]),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:t.resultshow,expression:"resultshow"}]},[a("div",{directives:[{name:"show",rawName:"v-show",value:t.show,expression:"show"}],staticClass:"result"},[t._v("\n            该用户不存在\n        ")]),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:!t.show,expression:"!show"}],staticClass:"hasresult"},[a("mt-cell",{staticClass:"nobckimg",attrs:{title:t.user.szNickName}},[a("span",[1==this.user.nStatus?a("span",[t._v("已添加")]):a("mt-button",{nativeOn:{click:function(e){if(e.stopPropagation(),e.target!==e.currentTarget)return null;t.add(e)}}},[t._v("添加")])],1),t._v(" "),a("img",{attrs:{slot:"icon",src:""==t.user.szHeadPicUrl?s("ja/j"):t.user.szHeadPicUrl,width:"40",height:"40"},slot:"icon"})])],1)])],1)},staticRenderFns:[]};var u=s("VU/8")(o,c,!1,function(t){s("UJ8S")},"data-v-1c153727",null);e.default=u.exports},UJ8S:function(t,e){}});
//# sourceMappingURL=12.c207ade0aa0330446da8.js.map