webpackJsonp([28],{"+Ds+":function(t,e){},HvZu:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});a("OgVB");var n=a("/Lyv"),i=a.n(n),r=a("mvHQ"),s=a.n(r),o={name:"winnerfen",props:{isCurrent:{type:Boolean}},watch:{isCurrent:function(t,e){t&&this.group.arr.length}},data:function(){return{starttime:0,endtime:0,startDate:new Date("2017-01-01"),endDate:new Date,startTimestr:"",endTimestr:"",clubid:"",userid:"",selected:"1",selectOne:"-1",hasClick:!1,group:{arr:[],totalCount:0,nextPage:0,totalPages:0}}},methods:{onValuesChange:function(t,e){e[0]>e[1]&&t.setSlotValue(1,e[0])},open:function(){this.$refs.picker.open()},open2:function(){this.$refs.pickerend.open()},handleConfirmS:function(t){this.starttime=t,this.startTimestr=this.formateTimeObj(t)+" 00:00:00"},handleConfirmE:function(t){this.endtime=t,this.endTimestr=this.formateTimeObj(t)+" 23:59:59"},formateTimeObj:function(t){var e=t.getFullYear(),a=t.getMonth()+1,n=t.getDate();return a<10&&(a="0"+a),n<10&&(n="0"+n),e+"-"+a+"-"+n},loadMore:function(){var t={params:{functionname:"GetFriendFenChStatis",body:s()({startDate:this.startTime,endDate:this.endTime,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE,nClubID:parseInt(this.selectOne)})}};this.getList(t)},getList:function(t){var e=this;this.$http.get(this.baseUrl+"/Main/GetData",t).then(function(t){var a=t.data;e.hasClick=!0,1==a.code?(e.group.arr=e.group.arr.concat(a.body),e.group.nextPage=e.group.nextPage+1,e.group.totalPages=Math.ceil(a.totalCount/e.PAGESIZE),e.group.totalCount=a.totalCount):i()("提示",a.msg)})},search:function(){if("-1"==this.selectOne)return i()("提示","请先选择俱乐部"),!1;if(""==this.startTime)return i()("提示","起始时间不能为空"),!1;if(""==this.endTime)return i()("提示","结束时间不能为空"),!1;this.group={arr:[],totalCount:0,nextPage:0,totalPages:0};var t={params:{functionname:"GetFriendFenChStatis",body:s()({startDate:this.startTime,endDate:this.endTime,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE,nClubID:parseInt(this.selectOne)})}};this.getList(t)}},created:function(){},mounted:function(){}},l={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"winnerfen"}},[a("div",{staticClass:"select"},[a("label",[t._v("俱乐部选择")]),t._v(" "),a("select",{directives:[{name:"model",rawName:"v-model",value:t.selectOne,expression:"selectOne"}],on:{change:function(e){var a=Array.prototype.filter.call(e.target.options,function(t){return t.selected}).map(function(t){return"_value"in t?t._value:t.value});t.selectOne=e.target.multiple?a:a[0]}}},[a("option",{attrs:{selected:""},domProps:{value:-1}},[t._v("点击选择 -- 俱乐部")]),t._v(" "),t._l(t.$store.state.clubList,function(e,n){return a("option",{key:n,domProps:{value:e.nClubID}},[t._v(t._s(e.szClubName))])})],2)]),t._v(" "),a("div",{on:{click:t.open}},[a("mt-field",{attrs:{label:"起始时间",disableClear:!0,readonly:!0,placeholder:"点击选择时间",state:""==t.startTimestr?"warning":""},model:{value:t.startTimestr,callback:function(e){t.startTimestr="string"==typeof e?e.trim():e},expression:"startTimestr"}})],1),t._v(" "),a("div",{on:{click:t.open2}},[a("mt-field",{attrs:{label:"结束时间",readonly:!0,disableClear:!0,placeholder:"点击选择时间",state:""==t.endTimestr?"warning":""},model:{value:t.endTimestr,callback:function(e){t.endTimestr="string"==typeof e?e.trim():e},expression:"endTimestr"}})],1),t._v(" "),a("div",{staticStyle:{padding:"15px 10px"}},[a("mt-button",{attrs:{type:"danger",size:"large"},nativeOn:{click:function(e){t.search(e)}}},[t._v("查询")])],1),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:t.hasClick,expression:"hasClick"}],staticClass:"result"},[a("div",{staticClass:"head"},[t._v("查询结果")]),t._v(" "),a("div",{staticClass:"hasresult"},[t._l(t.group.arr,function(e,n){return a("div",{key:n,staticClass:"record"},[a("div",{staticStyle:{width:"90px"}},[a("span",{staticClass:"title"},[t._v("日期")]),a("br"),a("span",[t._v(t._s(e.tEndTime))])]),t._v(" "),a("div",{staticStyle:{width:"70px"}},[a("span",{staticClass:"title"},[t._v(" 服务费比例")]),a("br"),a("span",[t._v(t._s(e.nTaxRateBig/10)+"%")])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("服务费数额")]),a("br"),a("span",[t._v(t._s(e.nTotalbet))])])])}),t._v(" "),0==t.group.arr.length?a("div",{staticClass:"noresult"},[t._v("\n                无记录\n            ")]):t._e(),t._v(" "),t.group.arr.length>0?a("div",[a("div",{staticStyle:{margin:"10px 0px"}},[t.group.nextPage<t.group.totalPages?a("mt-button",{attrs:{type:"primary",size:"large"},nativeOn:{click:function(e){t.loadMore(e)}}},[t._v("加载更多")]):a("mt-button",{attrs:{type:"default",size:"large"}},[t._v("已无更多数据")])],1)]):t._e()],2)]),t._v(" "),a("mt-datetime-picker",{ref:"picker",attrs:{type:"date",startDate:t.startDate,endDate:t.endDate,"year-format":"{value}年","month-format":"{value}月","date-format":"{value}日"},on:{confirm:t.handleConfirmS},model:{value:t.starttime,callback:function(e){t.starttime="string"==typeof e?e.trim():e},expression:"starttime"}}),t._v(" "),a("mt-datetime-picker",{ref:"pickerend",attrs:{type:"date",startDate:t.startDate,endDate:t.endDate,"year-format":"{value}年","month-format":"{value}月","date-format":"{value}日"},on:{confirm:t.handleConfirmE},model:{value:t.endtime,callback:function(e){t.endtime="string"==typeof e?e.trim():e},expression:"endtime"}})],1)},staticRenderFns:[]};var c=a("VU/8")(o,l,!1,function(t){a("+Ds+")},"data-v-40e742c3",null);e.default=c.exports}});
//# sourceMappingURL=28.85df1fc2cfac413fa7af.js.map