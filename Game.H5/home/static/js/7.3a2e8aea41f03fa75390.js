webpackJsonp([7],{"j/Dn":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});a("OgVB");var n=a("/Lyv"),i=a.n(n),o=a("mvHQ"),r=a.n(o),s={name:"bairenfenchen",props:{isCurrent:{type:Boolean}},watch:{isCurrent:function(t,e){t&&this.group.arr.length}},data:function(){return{starttime:0,clubid:"",roomNum:0,group:{arr:[],totalCount:0,nextPage:0,totalPages:0}}},methods:{setClubgamestatue:function(t){var e=t,a={functionname:"SetClubCharge",body:r()({nClubID:e.clubid,roomNum:e.roomNum})};this.$http.post(this.baseUrl+"/Main/PostData",a).then(function(t){var e=t.data;e.code,i()("提示",e.msg)}).catch(function(t){i()("提示","出错")})},loadMore:function(){var t={params:{functionname:"GetClubChargeDetail",body:r()({nClubID:this.clubid,roomNum:this.roomNum,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE})}};this.getList(t)},getList:function(t){var e=this;this.$http.get(this.baseUrl+"/Main/GetData",t).then(function(t){var a=t.data;1==a.code?(e.group.arr=e.group.arr.concat(a.body),e.group.nextPage=e.group.nextPage+1,e.group.totalPages=Math.ceil(a.totalCount/e.PAGESIZE),e.group.totalCount=a.totalCount):i()("提示",a.msg)})},search:function(){this.group={arr:[],totalCount:0,nextPage:0,totalPages:0};var t={params:{functionname:"GetClubChargeDetail",body:r()({nClubID:this.clubid,roomNum:this.roomNum,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE})}};this.getList(t)}},created:function(){this.roomNum=this.$route.query.roomNum,this.clubid=this.$route.query.clubId,this.loadMore()},mounted:function(){}},u={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"chargelogdetail"}},[a("mt-header",{attrs:{title:"俱乐部收费明细",fixed:!0}},[a("mt-button",{attrs:{slot:"left",icon:"back"},nativeOn:{click:function(e){t.$router.go(-1)}},slot:"left"},[t._v("返回")]),t._v(" "),t._e()],1),t._v(" "),a("div",{staticClass:"result"},[a("div",{staticClass:"head"},[t._v("查询结果")]),t._v(" "),a("div",{staticClass:"hasresult"},[t._l(t.group.arr,function(e,n){return a("div",{key:n,staticClass:"record",on:{click:function(e){t.showInput(n)}}},[a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("玩家")]),a("br"),a("span",[t._v(t._s(e.nickName))])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("时间")]),a("br"),a("span",[t._v(t._s(e.createTimeStr))])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("耗钻")]),a("br"),a("span",[t._v(t._s(e.diamond))])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("类型")]),a("br"),a("span",[t._v(t._s(6==e.type?"消耗":"返还"))])])])}),t._v(" "),0==t.group.arr.length?a("div",{staticClass:"noresult"},[t._v("\n                无记录\n            ")]):t._e(),t._v(" "),t.group.arr.length>0?a("div",[a("div",{staticStyle:{margin:"10px 0px"}},[t.group.nextPage<t.group.totalPages?a("mt-button",{attrs:{type:"primary",size:"large"},nativeOn:{click:function(e){t.loadMore(e)}}},[t._v("加载更多")]):a("mt-button",{attrs:{type:"default",size:"large"}},[t._v("已无更多数据")])],1)]):t._e()],2)])],1)},staticRenderFns:[]};var l=a("VU/8")(s,u,!1,function(t){a("zvPo")},"data-v-a284c5c2",null);e.default=l.exports},zvPo:function(t,e){}});
//# sourceMappingURL=7.3a2e8aea41f03fa75390.js.map