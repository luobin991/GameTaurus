webpackJsonp([10],{hoYs:function(t,e){},"wY7/":function(t,e,s){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=s("mvHQ"),i=s.n(n),a=(s("OgVB"),s("/Lyv")),r=s.n(a),o={name:"ClubMember",components:{NnCell:s("lIqI").a},data:function(){return{nPlayerId:0,id:0,user:{},acess:""}},methods:{showInput:function(t){var e=t,s=this,n="";1==e?n="增加金币":2==e?n="减少金币":3==e?n="追加积分":4==e&&(n="减少积分"),r.a.prompt("  ","测试",{title:e<=2?"调整金币":"调整积分",showCancelButton:!0,showInput:!0,inputPlaceholder:n}).then(function(t){var n=t.value;t.action;if(parseInt(n)>0){if(2==e||4==e)n>0&&(n=0-n);else if(n<0)return r()("提示","请正确输入整数"),!1;s.setNumberPost(n,e)}else r()("提示","请正确输入整数")},function(t){t.value,t.action})},setNumberPost:function(t,e){var s=this,n={functionname:1==e||2==e?"AddClubMemberCoinLimit":"AddClubMemberScoreLimit",body:i()({nClubId:s.clubId,userId:s.userId,val:t})};this.$http.post(this.baseUrl+"/Main/PostData",n).then(function(t){var n=t.data;1==n.code?(3==e||4==e?(s.user.currentScore=n.body.currentScore,s.user.scoreLimit=n.body.scoreLimit):2!=e&&1!=e||(s.user.coin=n.body.coin),r()("提示",n.msg)):r()("提示",n.msg)}).catch(function(t){r()("提示","出错")})},getMemberDetail:function(){var t=this,e={params:{functionname:"GetClubUserInfo",body:i()({userid:parseInt(t.userId),nClubId:parseInt(t.clubId)})}};this.$http.get(this.baseUrl+"/Main/GetData",e).then(function(e){var s=e.data;1==s.code?t.user=s.body:r()("提示",s.msg)}).catch(function(t){})},getAcess:function(){var t=this,e={params:{functionname:"GetClubAuth",body:i()({nClubId:parseInt(this.clubId)})}};this.$http.get(this.baseUrl+"/Main/GetData",e).then(function(e){var s=e.data;1==s.code?(t.acess=s.body.position,console.log(t.acess)):r()("提示",s.msg)})}},created:function(){this.userId=this.$route.query.userId,this.clubId=this.$route.query.clubId,this.getAcess(),this.getMemberDetail()},mounted:function(){}},u={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"ClubMember"}},[n("mt-header",{attrs:{title:"俱乐部成员简介",fixed:!0}},[n("mt-button",{attrs:{slot:"left",icon:"back"},nativeOn:{click:function(e){t.$router.go(-1)}},slot:"left"},[t._v("返回")]),t._v(" "),1==t.user.position&&2==t.user.nLevel?n("mt-button",{attrs:{slot:"right",icon:"more"},nativeOn:{click:function(e){t.toolShow=!t.toolShow}},slot:"right"}):t._e()],1),t._v(" "),n("div",{staticClass:"content"},[n("div",{staticClass:"user"},[n("div",{staticClass:"img"},[n("img",{attrs:{src:""==t.user.szHeadPicUrl?s("ja/j"):t.user.headImgUrl,width:"60",alt:""}})]),t._v(" "),n("div",{staticClass:"nichen"},[n("div",[t._v("昵称："+t._s(t.user.userName)),n("br")]),t._v(" "),n("p",{staticClass:"mark"},[t._v("ID:"),n("span",{staticClass:"markname"},[t._v(t._s(t.user.userId))]),t._v(" "),n("i",{staticClass:"iconfont icon-edit"})])])]),t._v(" "),n("mt-cell",{attrs:{title:"现有积分/总积分额度:",value:""}},[n("span",[t._v(" "+t._s(t.user.currentScore+"/"+t.user.scoreLimit)+" \n            "),0==this.acess?n("mt-button",{attrs:{type:"danger",size:"small"},nativeOn:{click:function(e){t.showInput(3)}}},[t._v("+ ")]):t._e(),t._v(" "),0==this.acess?n("mt-button",{attrs:{type:"primary",size:"small"},nativeOn:{click:function(e){t.showInput(4)}}},[t._v("- ")]):t._e()],1)]),t._v(" "),n("mt-cell",{attrs:{title:"成员加入时间"}},[n("span",[t._v(t._s(t.user.createTimeStr))])]),t._v(" "),n("div",{staticClass:"ge"}),t._v(" "),0==t.user.position?n("mt-button",{staticClass:" nnbutton",attrs:{type:"danger",size:"large"}},[t._v("当前玩家是创建者")]):1==t.user.position?n("mt-button",{staticClass:" nnbutton",attrs:{type:"danger",size:"large"}},[t._v("当前玩家是管理员")]):t._e(),t._v(" "),n("mt-button",{staticClass:"deletemember nnbutton",attrs:{size:"large"},nativeOn:{click:function(e){t.$router.push("/usergamelog?userId="+t.userId+"&clubId="+t.clubId)}}},[t._v("战绩记录")]),t._v(" "),n("mt-button",{staticClass:"deletemember nnbutton",attrs:{size:"large"},nativeOn:{click:function(e){t.$router.push("/consumelog?userId="+t.userId+"&clubId="+t.clubId)}}},[t._v("消耗记录")])],1)],1)},staticRenderFns:[]};var c=s("VU/8")(o,u,!1,function(t){s("hoYs")},"data-v-598e12aa",null);e.default=c.exports}});
//# sourceMappingURL=10.9bf1d830865ed5db72c4.js.map