webpackJsonp([27],{AfMA:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});a("OgVB");var i=a("/Lyv"),r=a.n(i),s=a("mvHQ"),n=a.n(s),o={name:"ConsumptionLog",props:{isCurrent:{type:Boolean}},watch:{isCurrent:function(t,e){t&&0==this.group.arr.length&&console.log("开始网络请求")}},data:function(){return{starttime:0,endtime:0,startDate:new Date("2017-01-01"),endDate:new Date,startTimestr:"",endTimestr:"",userid:"",selected:"1",selectOne:"-1",hasClick:!1,group:{arr:[],totalCount:0,nextPage:0,totalPages:0}}},methods:{onValuesChange:function(t,e){e[0]>e[1]&&t.setSlotValue(1,e[0])},open:function(){this.$refs.picker.open()},open2:function(){this.$refs.pickerend.open()},handleConfirmS:function(t){this.starttime=t,this.startTimestr=this.formateTimeObj(t)+" 00:00:00"},handleConfirmE:function(t){this.endtime=t,this.endTimestr=this.formateTimeObj(t)+" 23:59:59"},formateTimeObj:function(t){var e=t.getFullYear(),a=t.getMonth()+1,i=t.getDate();return a<10&&(a="0"+a),i<10&&(i="0"+i),e+"-"+a+"-"+i},loadMore:function(){var t={params:{functionname:"GetLowerUserDiamond",body:n()({userid:this.userid,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE,startTimestr:this.startTimestr,endTimestr:this.endTimestr})}};this.getList(t)},getList:function(t){var e=this;this.$http.get(this.baseUrl+"/Main/GetData",t).then(function(t){var a=t.data;e.hasClick=!0,1==a.code?(e.group.arr=e.group.arr.concat(a.body),e.group.nextPage=e.group.nextPage+1,e.group.totalPages=Math.ceil(a.totalCount/e.PAGESIZE),e.group.totalCount=a.totalCount):r()("提示",a.msg)})},search:function(){this.group={arr:[],totalCount:0,nextPage:0,totalPages:0};var t={params:{functionname:"GetLowerUserDiamond",body:n()({userid:this.userid,pageIndex:this.group.nextPage,pageSize:this.PAGESIZE,startTimestr:this.startTimestr,endTimestr:this.endTimestr})}};this.getList(t)}},created:function(){},mounted:function(){}},l={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{attrs:{id:"ConsumptionLog"}},[a("mt-field",{attrs:{label:"用户ID",placeholder:"用户ID"},model:{value:t.userid,callback:function(e){t.userid="string"==typeof e?e.trim():e},expression:"userid"}}),t._v(" "),a("div",{on:{click:t.open}},[a("mt-field",{attrs:{label:"起始时间",disableClear:!0,readonly:!0,placeholder:"点击选择时间",state:""==t.startTimestr?"warning":""},model:{value:t.startTimestr,callback:function(e){t.startTimestr="string"==typeof e?e.trim():e},expression:"startTimestr"}})],1),t._v(" "),a("div",{on:{click:t.open2}},[a("mt-field",{attrs:{label:"结束时间",disableClear:!0,readonly:!0,placeholder:"点击选择时间",state:""==t.endTimestr?"warning":""},model:{value:t.endTimestr,callback:function(e){t.endTimestr="string"==typeof e?e.trim():e},expression:"endTimestr"}})],1),t._v(" "),a("div",{staticStyle:{padding:"15px 10px"}},[a("mt-button",{attrs:{type:"danger",size:"large"},nativeOn:{click:function(e){t.search(e)}}},[t._v("查询")])],1),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:t.hasClick,expression:"hasClick"}],staticClass:"result"},[a("div",{staticClass:"head"},[t._v("查询结果")]),t._v(" "),a("div",{staticClass:"hasresult"},[t._l(t.group.arr,function(e,i){return a("div",{key:i,staticClass:"record"},[a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("ID")]),a("br"),a("span",[t._v(t._s(e.userId))])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("昵称")]),a("br"),a("span",[t._v(t._s(e.nickName))])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("钻石")]),a("br"),a("span",[t._v(t._s(e.changedDiamond))])]),t._v(" "),a("div",{staticStyle:{flex:"1"}},[a("span",{staticClass:"title"},[t._v("日期")]),a("br"),a("span",[t._v(t._s(e.time))])])])}),t._v(" "),0==t.group.arr.length?a("div",{staticClass:"noresult"},[t._v("\n                无记录\n            ")]):t._e(),t._v(" "),t.group.arr.length>0?a("div",[a("div",{staticStyle:{margin:"10px 0px"}},[t.group.nextPage<t.group.totalPages?a("mt-button",{attrs:{type:"primary",size:"large"},nativeOn:{click:function(e){t.loadMore(e)}}},[t._v("加载更多")]):a("mt-button",{attrs:{type:"default",size:"large"}},[t._v("已无更多数据")])],1)]):t._e()],2)]),t._v(" "),a("mt-datetime-picker",{ref:"picker",attrs:{type:"date",startDate:t.startDate,endDate:t.endDate,"year-format":"{value}年","month-format":"{value}月","date-format":"{value}日"},on:{confirm:t.handleConfirmS},model:{value:t.starttime,callback:function(e){t.starttime="string"==typeof e?e.trim():e},expression:"starttime"}}),t._v(" "),a("mt-datetime-picker",{ref:"pickerend",attrs:{type:"date",startDate:t.startDate,endDate:t.endDate,"year-format":"{value}年","month-format":"{value}月","date-format":"{value}日"},on:{confirm:t.handleConfirmE},model:{value:t.endtime,callback:function(e){t.endtime="string"==typeof e?e.trim():e},expression:"endtime"}})],1)},staticRenderFns:[]};var d=a("VU/8")(o,l,!1,function(t){a("bTIW")},"data-v-4b7aaa53",null);e.default=d.exports},bTIW:function(t,e){}});
//# sourceMappingURL=27.fcf86340c881302a98a2.js.map