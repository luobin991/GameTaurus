webpackJsonp([25],{Dhrs:function(t,e){},"GXM/":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});a("OgVB");var s=a("/Lyv"),n=a.n(s),i=a("mvHQ"),r=a.n(i),l={name:"userquery",props:{isCurrent:{type:Boolean}},watch:{isCurrent:function(t,e){t&&0==this.group.arr.length&&console.log("开始网络请求")}},data:function(){return{starttime:0,endtime:0,startDate:new Date("2017-01-01"),endDate:new Date,startTimestr:"",endTimestr:"",clubid:"",userid:"",selected:"1",selectOne:"-1",hasClick:!1,group:{arr:[],totalCount:0,nextPage:0,totalPages:0}}},methods:{onValuesChange:function(t,e){e[0]>e[1]&&t.setSlotValue(1,e[0])},loadMore:function(){var t={params:{functionname:"GetClubWanPaiJuShu",body:r()({nPlayerId:parseInt(this.userid),nClubID:this.selectOne,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE})}};this.getList(t)},getList:function(t){var e=this;this.$http.get(this.baseUrl+"/Main/GetData",t).then(function(t){var a=t.data;e.hasClick=!0,1==a.code?(e.group.arr=e.group.arr.concat(a.body),e.group.nextPage=e.group.nextPage+1,e.group.totalPages=Math.ceil(a.totalCount/e.PAGESIZE),e.group.totalCount=a.totalCount):n()("提示",a.msg)})},search:function(){if("-1"==this.selectOne)return n()("提示","请先选择俱乐部"),!1;if(""==this.userid)return n()("提示","用户id不能为空"),!1;this.group={arr:[],totalCount:0,nextPage:0,totalPages:0};var t={params:{functionname:"GetClubWanPaiJuShu",body:r()({nPlayerId:parseInt(this.userid),nClubID:this.selectOne,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE})}};this.getList(t)}},created:function(){},mounted:function(){}},o={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"userquery"}},[a("div",{staticClass:"select"},[a("label",[t._v("俱乐部选择")]),t._v(" "),a("select",{directives:[{name:"model",rawName:"v-model",value:t.selectOne,expression:"selectOne"}],on:{change:function(e){var a=Array.prototype.filter.call(e.target.options,function(t){return t.selected}).map(function(t){return"_value"in t?t._value:t.value});t.selectOne=e.target.multiple?a:a[0]}}},[a("option",{attrs:{selected:""},domProps:{value:-1}},[t._v("点击选择 -- 俱乐部")]),t._v(" "),t._l(t.$store.state.clubList,function(e,s){return a("option",{key:s,domProps:{value:e.nClubID}},[t._v(t._s(e.szClubName))])})],2)]),t._v(" "),a("mt-field",{attrs:{label:"用户id",placeholder:"用户id",disableClear:!0},model:{value:t.userid,callback:function(e){t.userid="string"==typeof e?e.trim():e},expression:"userid"}}),t._v(" "),a("div",{staticStyle:{padding:"15px 10px"}},[a("mt-button",{attrs:{type:"danger",size:"large"},nativeOn:{click:function(e){t.search(e)}}},[t._v("查询")])],1),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:t.hasClick,expression:"hasClick"}],staticClass:"result"},[a("div",{staticClass:"head"},[t._v("查询结果")]),t._v(" "),a("div",{staticClass:"hasresult"},[t._l(t.group.arr,function(e,s){return a("div",{key:s,staticClass:"record"},[a("div",{staticStyle:{width:"80px"}},[t._m(0,!0),a("br"),a("span",[t._v(t._s(e.tEndTime))])]),t._v(" "),a("div",{staticStyle:{flex:"1",overflow:"hidden"}},[t._m(1,!0),a("br"),a("span",[t._v(t._s(e.szNickName))])]),t._v(" "),a("div",{staticStyle:{width:"80px"}},[a("span",{staticClass:"title"},[t._v("玩牌局数")]),a("br"),a("span",[t._v(t._s(e.nRound))])]),t._v(" "),a("div",{staticStyle:{width:"80px"}},[a("span",{staticClass:"title"},[t._v(" 开房次数")]),a("br"),a("span",[t._v(t._s(e.nTableIDCount))])])])}),t._v(" "),0==t.group.arr.length?a("div",{staticClass:"noresult"},[t._v("\n                无记录\n            ")]):t._e(),t._v(" "),t.group.arr.length>0?a("div",[a("div",{staticStyle:{margin:"10px 0px"}},[t.group.nextPage<t.group.totalPages?a("mt-button",{attrs:{type:"primary",size:"large"},nativeOn:{click:function(e){t.loadMore(e)}}},[t._v("加载更多")]):a("mt-button",{attrs:{type:"default",size:"large"}},[t._v("已无更多数据")])],1)]):t._e()],2)])],1)},staticRenderFns:[function(){var t=this.$createElement,e=this._self._c||t;return e("span",{staticClass:"title"},[e("i",{staticClass:"iconfont icon-shijian4"}),this._v("日期")])},function(){var t=this.$createElement,e=this._self._c||t;return e("span",{staticClass:"title"},[e("i",{staticClass:"iconfont icon-nicheng"}),this._v(" 昵称")])}]};var u=a("VU/8")(l,o,!1,function(t){a("Dhrs")},"data-v-5252df9f",null);e.default=u.exports}});
//# sourceMappingURL=25.10d0932d6562e1c0288c.js.map